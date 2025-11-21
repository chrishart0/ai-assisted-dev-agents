#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# generate_pr_context.sh
#
# Create a "PR-like" context between a base branch and a feature branch:
# - Shows changed files (with status)
# - Shows per-file diffs
# - Filters out noisy files (lockfiles, build artifacts, etc) by default
# - Lists which files were filtered out
#
# This is designed to be LLM friendly.
###############################################################################

usage() {
  cat <<'EOF'
Usage:
  generate_pr_context.sh <feature_branch> [<base_branch>=main] [<output_file>] [<extra_excludes_csv>]

Positional arguments:
  feature_branch         The branch you want to review. Required.
  base_branch            The branch to compare against. Default: main
  output_file            Where to write the PR style context. Default: stdout
  extra_excludes_csv     Optional comma separated list of extra glob patterns
                         to exclude from diffs.

Examples:
  # Basic usage, compare my-feature to main and print to stdout
  generate_pr_context.sh my-feature

  # Compare against trunk and write to a file
  generate_pr_context.sh my-feature trunk pr_context_for_llm.md

  # Add extra excludes for this run (for example, snapshot files and docs)
  generate_pr_context.sh my-feature main pr_context_for_llm.md "*.snap,docs/*"

What this script does:
  1. Finds the merge base between <base_branch> and <feature_branch> so
     behavior matches how GitHub computes PR diffs.
  2. Lists all changed files and their status (A, M, D, etc).
  3. Filters out common noisy files such as:
       - package-lock.json, pnpm-lock.yaml, yarn.lock, bun.lockb
       - node_modules, dist, build, .next, coverage
       - Many common lockfiles from Python, Ruby, Rust, Go, PHP, .NET, etc
  4. Shows you:
       - The filter configuration (default patterns plus any extra patterns)
       - A list of filtered out files
       - Per file diffs for the remaining files, each wrapped in:
           ----- FILE_BEGIN path -----
           ```diff
           <diff>
           ```
           ----- FILE_END path -----

You can feed the resulting file to an LLM and tell it to:
  - First read the CHANGED_FILES section
  - Then iterate over each FILE_BEGIN / FILE_END block
  - Ignore FILTERED_OUT_FILES unless specifically needed

For help:
  generate_pr_context.sh --help
EOF
}

die() {
  echo "Error: $1" >&2
  echo >&2
  usage >&2
  exit 1
}

# Handle help flags early
if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

# Usage:
#   ./generate_pr_context.sh <feature_branch> [<base_branch>=main] [<output_file>] [<extra_excludes_csv>]

feature_branch="${1:-}"
if [[ -z "${feature_branch}" ]]; then
  die "feature_branch is required."
fi

base_branch="${2:-main}"
output_file="${3:-/dev/stdout}"
extra_excludes_csv="${4:-}"

# Optional: fetch latest refs (comment out if you do not want this).
# git fetch origin "${base_branch}" "${feature_branch}" >/dev/null 2>&1 || true

# Ensure we are inside a git repository
if ! git rev-parse --git-dir >/dev/null 2>&1; then
  die "this is not a git repository."
fi

# Ensure branches exist
if ! git rev-parse --verify "${base_branch}" >/dev/null 2>&1; then
  die "base branch '${base_branch}' does not exist."
fi

if ! git rev-parse --verify "${feature_branch}" >/dev/null 2>&1; then
  die "feature branch '${feature_branch}' does not exist."
fi

merge_base_commit="$(git merge-base "${base_branch}" "${feature_branch}")"
if [[ -z "${merge_base_commit}" ]]; then
  die "could not determine merge base between ${base_branch} and ${feature_branch}."
fi

# Default exclude patterns for common ecosystems
# These are GLOB patterns matched via [[ "$path" == $pattern ]] semantics.
DEFAULT_EXCLUDE_PATTERNS=(
  # Node / JS / TS
  'package-lock.json' '*/package-lock.json'
  'pnpm-lock.yaml'    '*/pnpm-lock.yaml'
  'yarn.lock'         '*/yarn.lock'
  'bun.lockb'         '*/bun.lockb'

  # Python
  '.venv/*'           '*/.venv/*'
  'venv/*'            '*/venv/*'
  '__pycache__/*'     '*/__pycache__/*'
  '*.pyc'

  # Ruby
  'Gemfile.lock'      '*/Gemfile.lock'

  # PHP
  'composer.lock'     '*/composer.lock'

  # Rust
  'Cargo.lock'        '*/Cargo.lock'

  # Go
  'go.sum'            '*/go.sum'

  # .NET
  'packages.lock.json'   '*/packages.lock.json'
  'project.assets.json'  '*/project.assets.json'

  # Elixir
  'mix.lock'          '*/mix.lock'

  # Swift / SPM
  'Package.resolved'  '*/Package.resolved'

  # Haskell (Stack / Cabal)
  'stack.yaml.lock'       '*/stack.yaml.lock'
  'cabal.project.freeze'  '*/cabal.project.freeze'

  # Java / Kotlin (Gradle)
  'gradle.lockfile'   '*/gradle.lockfile'

  # Typical build and artifact directories
  'node_modules/*'    '*/node_modules/*'
  'dist/*'            '*/dist/*'
  'build/*'           '*/build/*'
  '.next/*'           '*/.next/*'
  'out/*'             '*/out/*'
  '.turbo/*'          '*/.turbo/*'
  'coverage/*'        '*/coverage/*'
  '.pytest_cache/*'   '*/.pytest_cache/*'
  '.mypy_cache/*'     '*/.mypy_cache/*'
)

EXTRA_EXCLUDE_PATTERNS=()
if [[ -n "${extra_excludes_csv}" ]]; then
  IFS=',' read -ra EXTRA_EXCLUDE_PATTERNS <<< "${extra_excludes_csv}"
fi

should_exclude() {
  local path="$1"
  local pattern

  for pattern in "${DEFAULT_EXCLUDE_PATTERNS[@]}" "${EXTRA_EXCLUDE_PATTERNS[@]}"; do
    [[ -z "${pattern}" ]] && continue
    if [[ "${path}" == $pattern ]]; then
      return 0
    fi
  done

  return 1
}

# All changed files, before filtering
all_changed_files="$(git diff --name-only "${merge_base_commit}" "${feature_branch}")"

if [[ -z "${all_changed_files}" ]]; then
  echo "No changes between ${base_branch} and ${feature_branch}." | tee "${output_file}"
  exit 0
fi

included_files=""
excluded_files=""

while IFS= read -r file_path; do
  [[ -z "${file_path}" ]] && continue
  if should_exclude "${file_path}"; then
    excluded_files+="${file_path}"$'\n'
  else
    included_files+="${file_path}"$'\n'
  fi
done <<< "${all_changed_files}"

{
  echo "===== PR_CONTEXT_BEGIN ====="
  echo
  echo "Base branch: ${base_branch}"
  echo "Feature branch: ${feature_branch}"
  echo "Merge base commit: ${merge_base_commit}"
  echo

  echo "===== FILTER_CONFIG_BEGIN ====="
  echo "Default exclude patterns:"
  for p in "${DEFAULT_EXCLUDE_PATTERNS[@]}"; do
    echo "  - ${p}"
  done
  echo
  echo "Extra exclude patterns:"
  if ((${#EXTRA_EXCLUDE_PATTERNS[@]} == 0)); then
    echo "  - (none)"
  else
    for p in "${EXTRA_EXCLUDE_PATTERNS[@]}"; do
      echo "  - ${p}"
    done
  fi
  echo "===== FILTER_CONFIG_END ====="
  echo

  echo "===== FILTERED_OUT_FILES_BEGIN ====="
  if [[ -z "${excluded_files}" ]]; then
    echo "(none)"
  else
    printf '%s\n' "${excluded_files}" | sed '/^$/d' | sort
  fi
  echo "===== FILTERED_OUT_FILES_END ====="
  echo

  echo "===== CHANGED_FILES_BEGIN ====="
  # Only include status lines for non excluded files
  git diff --name-status "${merge_base_commit}" "${feature_branch}" | \
  while read -r status path; do
    if should_exclude "${path}"; then
      continue
    fi
    printf "%s\t%s\n" "${status}" "${path}"
  done
  echo "===== CHANGED_FILES_END ====="
  echo

  echo "===== FILE_DIFFS_BEGIN ====="

  # Per file diffs for included files only
  if [[ -z "${included_files}" ]]; then
    echo "(no included files after filtering)"
  else
    while IFS= read -r file_path; do
      [[ -z "${file_path}" ]] && continue

      echo
      echo "----- FILE_BEGIN ${file_path} -----"
      echo '```diff'
      git diff -U3 "${merge_base_commit}" "${feature_branch}" -- "${file_path}"
      echo '```'
      echo "----- FILE_END ${file_path} -----"
    done <<< "${included_files}"
  fi

  echo
  echo "===== FILE_DIFFS_END ====="
  echo
  echo "===== PR_CONTEXT_END ====="

} > "${output_file}"
