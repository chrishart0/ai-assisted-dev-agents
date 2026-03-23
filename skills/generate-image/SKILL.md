---
name: generate-image
description: "Generate illustrations, diagrams, and infographics using Kie.ai API. Creates flat-style visuals with accurate text rendering. Use when you say 'generate image', 'make illustration', 'create diagram', or 'generate visual'."
user-invocable: true
argument-hint: "[description of what to generate]"
---

# Image Generation (Kie.ai)

You are generating visual content. **Everything you generate must look intentionally designed, not AI-generated.**

---

## Step 0: Load Context

1. Read the project's brand/design guide if one exists — get the color palette, typography, and style rules.
2. Get the `KEYAI_API_KEY` from `.env.local` (or the project's env file).

---

## Step 1: Pick Your Model

Three tiers. Pick the right one.

| If the image has... | Use | Model string | Cost | Speed |
|---|---|---|---|---|
| **4+ lines of text** (checklists, comparisons, labeled cards, tables, step-by-step) | **Nano Banana 2** | `nano-banana-2` | $0.06 (2K) | 4-6s |
| **Minimal text** (flow charts, abstract diagrams, icons, headers, 1-3 word labels) | **Imagen 4 Ultra** | `google/imagen4-ultra` | $0.06 | ~10s |
| **Ultra-precise text** (NB2 has errors after 2 re-rolls) | Nano Banana Pro | `nano-banana-pro` | $0.09 (2K) | 60-90s |

**NB2 is fast enough to iterate directly** ($0.06, 4-6s). You rarely need a separate draft model. For visual-only drafts, `google/imagen4-fast` ($0.02, ~5s) still works.

**Do NOT use** Imagen 4 for text-heavy infographics — it has a ~10-15% character error rate. Do NOT use Ideogram v3 — it hallucinates extra rows and mixes icon styles in structured comparisons. Do NOT use Flux models for anything with text.

**Present your plan to the user before generating:** Describe what you'll generate, the style, and the model you'll use.

---

## Step 2: Craft the Prompt

### For Nano Banana 2 (text-heavy — PRIMARY)

NB2 uses a "thinking" reasoning mode with 3 levels (Minimal/High/Dynamic). Structure your prompt with clear sections — it understands layout instructions well. **No `negative_prompt` parameter** — include negative instructions in the main prompt. Supports `google_search: true` for real-world reference grounding.

```
A clean, flat 2D infographic illustration. Style: modern flat design, no photorealism,
no 3D rendering, no people, no faces, no gradients.

Color palette: [USE PROJECT BRAND COLORS or default to:
navy blue (#0A2F5C), medium blue (#0066CC), amber gold (#D97706),
green (#16A34A) on a cool blue-gray background.]

Layout: [describe specific layout — "two cards side by side", "numbered checklist",
"vertical flow with arrow between steps"]

Content:
[Exact text to render. Spell everything correctly. Keep under 30 words total for
best accuracy. Each text element on its own line.]

Typography: Clean sans-serif font. Headers in navy, body text in dark navy.
All text same font size, same weight unless explicitly different.

Fill 70 percent of canvas height. No wasted space above or below.
Both cards/sections must be identical size.
```

**Nano Banana 2 tips:**
- Same prompting approach as Pro — NB2 inherits Pro's layout reasoning
- Limit to 4 rows/items per section for best results
- Spell out exact text strings — it renders what you write
- Specify icon types explicitly ("green checkmark icons", "amber X icons")
- Say "identical size" for matching elements — it respects this
- Keep total text under 30 words for ~95%+ accuracy; under 15 words for ~100%
- At 4-6s per generation, just re-roll if the first attempt has issues — no need for a draft model
- If text errors persist after 2-3 re-rolls, switch to `nano-banana-pro` for that specific image

### For Imagen 4 Ultra (visual-first)

Use the standard style prefix. Supports `negative_prompt` parameter.

**Style prefix (include in every Imagen 4 prompt):**
```
A clean, flat 2D illustration. Simple geometric shapes and icons.
Color palette: [USE PROJECT BRAND COLORS or default to:
navy blue (#0A2F5C), medium blue (#0066CC), amber gold (#D97706),
green (#16A34A) on a light off-white (#F6F9FC) background.]
Minimal detail, clear visual hierarchy, no people, no faces, no hands.
Style: modern flat design, infographic aesthetic.
```

**Negative prompt (include in every Imagen 4 request):**
```
photorealistic, people, faces, hands, fingers, stock photo, 3D render, corporate,
glossy, gradient mesh, lens flare, bokeh, depth of field, photograph, portrait,
hex codes, color codes, hashtag symbols, gradients
```

**Imagen 4 tips:**
- Describe colors by NAME only in the scene description — hex codes get rendered as text labels
- Spell out exact label strings: `labeled RECOMMEND below` not `labeled with the action`
- Always add: "Fill at least 70% of canvas height. No wasted space."
- For multiple labels: "identical visual weight, same font size, same boldness"
- Keep text to 1-3 word labels maximum

### General Rules (both models)

1. **Be specific about the concept.** Describe concrete visual elements, not abstract ideas.
2. **Specify layout.** "Horizontal flow left to right" or "Vertical stack of 4 rows."
3. **Match project terminology exactly.** Read the relevant content before generating.
4. **Keep it simple.** Fewer elements = cleaner result on mobile.
5. **Aspect ratio:** `16:9` for content illustrations. `1:1` for badges/icons.

---

## Step 3: Generate via API

Read the API key from the project's env file first.

### Nano Banana 2 (primary)

```bash
KEYAI_API_KEY=$(grep KEYAI_API_KEY .env.local | cut -d'=' -f2)
curl -s -X POST "https://api.kie.ai/api/v1/jobs/createTask" \
  -H "Authorization: Bearer $KEYAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "nano-banana-2",
    "input": {
      "prompt": "<YOUR FULL PROMPT HERE>",
      "aspect_ratio": "16:9",
      "resolution": "2K"
    }
  }'
```

Aspect ratio options: `1:1`, `1:4`, `1:8`, `2:3`, `3:2`, `3:4`, `4:1`, `4:3`, `4:5`, `5:4`, `8:1`, `9:16`, `16:9`, `21:9`, `auto`

Optional params: `google_search` (boolean, for real-world reference grounding), `image_input` (up to 14 images for style consistency), `output_format` (`JPG`/`PNG`)

### Nano Banana Pro (precision fallback)

```bash
curl -s -X POST "https://api.kie.ai/api/v1/jobs/createTask" \
  -H "Authorization: Bearer $KEYAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "nano-banana-pro",
    "input": {
      "prompt": "<YOUR FULL PROMPT HERE>",
      "aspect_ratio": "16:9",
      "resolution": "2K"
    }
  }'
```

### Imagen 4 Ultra

```bash
curl -s -X POST "https://api.kie.ai/api/v1/jobs/createTask" \
  -H "Authorization: Bearer $KEYAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "google/imagen4-ultra",
    "input": {
      "prompt": "<YOUR FULL PROMPT HERE>",
      "negative_prompt": "<NEGATIVE PROMPT>",
      "aspect_ratio": "16:9"
    }
  }'
```

For drafts: swap `google/imagen4-ultra` to `google/imagen4-fast`.

---

## Step 4: Poll for Results

Both models use the same polling endpoint:

```bash
curl -s "https://api.kie.ai/api/v1/jobs/recordInfo?taskId=<TASK_ID>" \
  -H "Authorization: Bearer $KEYAI_API_KEY"
```

`data.state`: `waiting`/`queuing`/`generating` = still processing, `success` = done (URLs in `resultJson`), `fail` = check `failMsg`.

**Polling cadence:** Nano Banana 2: wait 8s then poll (it's fast). Imagen 4: wait 15s then poll. Nano Banana Pro: wait 75s then poll (it's slower but worth it for precision).

---

## Step 5: Download, Convert, Save

1. Download immediately (URLs expire in 14-24 hours).
2. Convert to WebP: `cwebp -q 85 input.png -o output.webp`
3. Save to the project's image directory with a descriptive filename.
4. Verify file size < 200KB.
5. **Show the image to the user** for approval before integrating into content.

---

## Step 6: Verify Text Accuracy

**No model produces 100% accurate text.** Every image with text MUST be manually verified.

1. Read every word in the generated image
2. Compare against the prompt — any typos, missing words, extra words, garbled text?
3. If text errors: regenerate (usually faster than editing)
4. View at 375px width to confirm mobile readability

**Zero tolerance for typos.**

---

## Step 7: Iterate if Needed

- **Tweak the prompt** — be more specific about layout, colors, elements
- **NB2 is fast enough to iterate directly** (4-6s, $0.06) — no need for draft models in most cases
- **Generate 2-3 variants** by running the same prompt multiple times (different seeds)
- If NB2 produces a typo, re-roll — it usually gets it right on 2nd attempt
- If NB2 keeps producing text errors after 3 attempts, switch to `nano-banana-pro`
- If Imagen 4 keeps corrupting text after 2 attempts, switch to NB2

---

## Quality Checklist

Before marking an image as final:

- [ ] **Zero typos** — every word verified against prompt
- [ ] **No people, faces, or hands** visible
- [ ] **Brand colors** are dominant
- [ ] **Reads clearly at 375px width** (mobile test)
- [ ] **Flat illustration style** — not photorealistic, not 3D
- [ ] **Concept is clear** without explanation
- [ ] **File size** < 200KB WebP
- [ ] **Doesn't look "AI-generated"** — no artifacts, no uncanny elements
