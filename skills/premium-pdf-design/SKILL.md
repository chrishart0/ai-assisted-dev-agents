---
name: premium-pdf-design
description: "Design premium print-ready HTML ebooks and PDFs that feel like $150+ resources. Applies research-backed design patterns from consulting firms, luxury brands, and editorial publishers. Use when creating ebooks, whitepapers, reports, or any PDF that needs to signal authority and justify premium pricing."
user-invocable: true
argument-hint: "[document description or existing HTML file path]"
---

# Premium PDF Design

You are designing a premium print-ready HTML document. The standard is $150+ resource quality. Every design decision must pass this test: "Would this look at home in a McKinsey whitepaper or a luxury brand annual report?"

## Before Starting

Read these references:
1. **`references/premium-template.html`** - Production-tested HTML/CSS template with every component. **Start here.** Copy the CSS wholesale and build on the HTML patterns.
2. If the project has a brand/design guide, read it for palette and typography overrides.

### The template file

`references/premium-template.html` is a working 5-page HTML file that demonstrates:
- Cover page with marble texture background and gold stats bar
- Full-bleed art divider page
- Content page with all components (stat-row, highlight-box, key-insight, pull-quote, table)
- Content page with tables, do/dont comparisons, numbered cards, template boxes
- Back cover with art background and frosted branding card

Open it in Chrome to see it rendered. Every CSS value in the template was tested across 22 pages and survived two design reviews. Use these values as-is, don't reinvent them.

### Working from the template

1. Copy `premium-template.html` to your working directory
2. Replace placeholder text and `YOUR-*.jpg` image paths
3. Add pages by duplicating the content page `<div class="page">` blocks
4. Check overflow after every page addition (the JS snippet is in the Overflow Prevention section)
5. Generate art using an image generation tool if available, following the art direction rules below

## The Premium Design System

### The #1 Rule: White Space is the Differentiator

Premium resources leave 35-45% of every content page empty. Free ebooks cram edge to edge. When in doubt, remove content from a page rather than add it.

### Color: The 60-30-10 Rule

| Percentage | Role | Application |
|---|---|---|
| 60% | Page background + white space | Warm off-white (#fdfcfb) or pure white |
| 30% | Body text + headings | Near-black text (#2d2a28), navy headings (#1a1a2e) |
| 10% | Accent | Gold (#b8963e) for labels, borders, dividers. Used like a scalpel. |

**Color is rare and therefore powerful.** Never more than 2 brand colors visible on any single page.

### Typography: Playfair Display + Source Sans 3

| Element | Font | Size | Weight | Notes |
|---|---|---|---|---|
| Cover title | Playfair Display | 42-48pt | 900 | line-height 1.12-1.15 |
| Chapter title | Playfair Display | 26-28pt | 700 | Gold underline accent |
| Section header (h3) | Source Sans 3 | 11pt | 700 | ALL CAPS, letter-spacing 0.04em |
| Body text | Source Sans 3 | 10.5-11pt | 400 | line-height 1.6 |
| Pull quotes | Playfair Display | 11pt | 400 italic | Gold left border |
| Labels/eyebrows | Source Sans 3 | 7-8pt | 600 | ALL CAPS, letter-spacing 0.12em |
| Footer | Source Sans 3 | 6.5-7pt | 400 | ALL CAPS, muted color |

**Playfair Display below 14pt loses elegance.** Switch to Source Sans 3 for any text smaller than 14pt.

### Page Structure

```css
.page {
    width: 8.5in;
    height: 11in;
    padding: 0.5in 0.75in;
    padding-bottom: 0.75in;
    background: #fdfcfb; /* warm off-white */
    overflow: hidden;
}
```

### Component Hierarchy (from most to least emphasis)

1. **Key Insight boxes** - Dark navy background, gold left border, gold label. Max 1 per chapter.
2. **Stat rows** - Dark navy with gold numbers. Data punctuation marks. Max 1 per page.
3. **Highlight boxes** - Cream background, gold left border. For tips, rules, callouts.
4. **Pull quotes** - Playfair italic, gold left border. Max 1 per page, under 20 words.
5. **Tables** - Navy headers, uppercase labels, generous padding (8px 12px).
6. **Template boxes** - Light cream background, red placeholder text for fill-in content.

### Art & Section Dividers

Premium PDFs include 1-2 full-bleed abstract art pages as section dividers. These signal "this is a designed product, not a document."

**Art direction for generation:**
- Navy + gold + cream palette
- Abstract: brushstrokes, marble textures, architectural geometry, color fields
- Prompt must include "filling the entire image edge to edge, no frame, no border, no wall"
- Generate 6-10 candidates, select 2-3. Never use the first take.
- The art pieces should share a material language (all marble, or all painted, not mixed)

### Cover Page Pattern

The cover establishes the premium signal for the entire document:
- Title on cream upper section (Playfair Display, 44pt+)
- Abstract texture (marble, concrete) as bottom 40-50% background
- Dark overlay on texture for legibility
- Gold stats bar on the dark section
- Gold "PREMIUM RESOURCE" badge in footer
- No clip art. No stock photos. No illustrations.

### Back Cover Pattern

- Full-bleed abstract art (color field or texture)
- Frosted/translucent branding card centered
- Brand name, tagline, URL
- Gold accent divider

### Overflow Prevention Protocol

After EVERY CSS change, check overflow on all pages:
```js
const pages = document.querySelectorAll('.page');
for(let i=0; i<pages.length; i++) {
    const o = pages[i].scrollHeight - pages[i].clientHeight;
    if(o > 0) console.log('Page ' + i + ': OVERFLOW ' + o + 'px');
}
```

Content that overflows is silently clipped by `overflow: hidden`. This is a shipping blocker.

### What to AVOID (Canva Template Signals)

- Margins under 0.75in
- More than 2 font families
- Colored body text
- Gradient backgrounds on content pages
- Rounded corners > 4px
- Drop shadows on boxes
- Stock photos or clip art
- Paper/parchment textures
- Emoji in body text
- Different accent colors per section
- ALL CAPS headings longer than 5 words
- More than 3 consecutive body-text pages without a visual break

### Lessons Learned (Hard-Won from Production)

These are not theory. Every one of these caused a fix cycle in a real ebook build.

**Overflow is the #1 enemy. Check after EVERY CSS change.**
Don't batch CSS changes and check later. A 3px paragraph margin increase across 12 paragraphs = 36px overflow on dense pages. Run the overflow check JS after every single edit. Non-negotiable.

**Start with 9-10px paragraph spacing, not 6px.**
6px margin-bottom on paragraphs makes text run together. 9-10px is the minimum for premium feel at 10.5pt body text. Plan your page content budgets around this from the start, not as a retrofit.

**Dense chapter openers overflow first.**
Pages with chapter-number + title + subtitle + intro paragraph + stat-row + comparison box are the tightest. Budget 850px of content height for these (out of ~960px usable), leaving 110px safety margin. If a page has a stat-row AND a two-column comparison, it WILL overflow unless spacing is tight.

**Never use clip art or flat illustrations on a premium cover.**
The first version used a generated funnel illustration. It looked cheap immediately. Abstract material textures (marble, concrete, color fields) with a dark overlay for the stats section is the pattern that works. The cover sets the price perception for the entire document.

**Limit dark callout boxes to 1 per chapter, max.**
The first version had 6 dark navy key-insight boxes. By chapter 4 they lost all impact. Converted 3 to lighter highlight-boxes. Start with the rule: 1 dark box per chapter for the single most important takeaway. Everything else gets the lighter treatment.

**Standardize component padding in CSS, never inline.**
Inline style overrides (`style="padding: 10px 14px"`) on template-boxes created inconsistency that the reviewer caught. Define one padding value in the CSS class and never override it inline. If a component needs different padding, it's a different component.

**Section divider art must share a material language.**
Generating different styles (concrete, marble, textile) makes the document feel like three different books. Pick ONE material (marble with gold veins was the strongest) and generate variations within that material. Consistency > variety.

**Image generation prompts MUST include anti-framing language.**
Without explicit instructions, AI image generators create "a photo of art on a wall" or "a painting in a book" instead of the art itself. Every prompt must include: "filling the entire image edge to edge. No frame. No border. No wall visible. No book edge. The image IS the surface."

**Generate 6-10 art candidates. Use 2-3.**
The first takes were acceptable but not exceptional. Generating 10 candidates across different directions (sumi-e, marble, geometric, Rothko, architectural, fluid) and then selecting the best 2-3 produced dramatically better results. Budget for this iteration.

**The cover title line-height trap.**
Playfair Display at 42-48pt with default line-height (~1.02) makes multi-line titles feel compressed. Always set line-height: 1.12-1.15 explicitly on cover titles. This was caught in review and is easy to miss because it "looks fine" until you compare it to a properly spaced version.

### Quality Checklist

Before shipping any premium PDF:
- [ ] Zero overflow on all pages (run JS check, not visual inspection)
- [ ] Warm off-white background (not pure white)
- [ ] Max 2 colors per page (60-30-10 rule)
- [ ] Body text 10.5pt+ with 1.6 line-height
- [ ] Paragraph spacing 9-12px (not too tight, not double-spaced)
- [ ] Consistent component padding across all instances (grep for inline style overrides)
- [ ] H3s in Source Sans 3 uppercase (not Playfair)
- [ ] Cover uses abstract texture, not clip art or illustrations
- [ ] Cover title has line-height 1.12-1.15 (not default)
- [ ] Cover subtitle does not overlap background image/texture
- [ ] 1-2 full-bleed art pages as section dividers (same material language)
- [ ] Back cover with art + branding
- [ ] All tables use identical th/td sizing
- [ ] Gold accent used consistently (labels, borders, dividers)
- [ ] Dark callout boxes: max 1 per chapter
- [ ] Footer is understated (6.5-7pt, uppercase, muted)
- [ ] No inline padding/margin overrides that differ from CSS class values
- [ ] Tested Chrome Print > Save as PDF > Margins: None > Background graphics: On
