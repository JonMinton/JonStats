# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Branch Workflow

Work directly on `main`. The former `experimental/claude` staging branch was retired in July 2026 (merged to main and deleted) — Jon no longer wants Claude work staged on a separate branch. At the start of a session, `git pull --ff-only` on main to make sure you're current.

Two practices worth keeping from the old workflow:
- Commit source file changes (.qmd, .md, references.bib) rather than rendered output where possible
- Avoid running `quarto render` unless the user asks — re-rendering is risky here (some time-series packages have changed behaviour or publication status since the materials were written; see .claude/quarto-rendering-best-practices.md)

## Project Overview

This is Jon Minton's statistics course website - a static site built with Quarto that consolidates material from his blog into structured course pages. The site covers:
- **Main Course**: GLM theory, likelihood, simulation, and "statistics as circuits"
- **Supplementary Courses**: Causal inference, time series, hacker stats, p-values
- **Extra Content**: Repeated measures (in development)

**Key Difference from jon-blog:** This site consolidates multiple blog posts into single comprehensive pages, making internal linking and content organization different from the blog.

## Building and Rendering

**Preview the site locally:**
```bash
quarto preview
```

**Render the full site:**
```bash
quarto render
```

The rendered site outputs to the `_site/` directory (configured in `_quarto.yml`).

**Monitoring long-running renders:**
When `quarto render` is run in the background, use these **safe** methods to check progress without interrupting the process:

1. **Check process table (safest):**
   ```bash
   ps aux | grep -E "quarto|render" | grep -v grep
   ```
   This only reads system info and won't interrupt the process.

2. **Check background task output:**
   Use the `BashOutput` tool with the background task ID. This reads buffered output without sending signals to the process.

**AVOID:** Calling the `BashOutput` tool excessively or asking about progress too frequently, as this can sometimes interrupt the render process. Check progress sparingly (e.g., every few minutes for long renders).

## Project Structure

```
.
├── _quarto.yml              # Main Quarto configuration
├── pages/                   # All course pages
│   ├── main-course/        # Core GLM course content
│   │   ├── intro-to-glms/
│   │   ├── likelihood-and-simulation-theory/
│   │   ├── complete-simulation-example/
│   │   └── statistics-as-circuits/
│   ├── extra-courses/      # Supplementary courses
│   │   ├── causal-inference/
│   │   ├── time-series/
│   │   ├── hacker-stats/
│   │   ├── p-values-stat-sig/
│   │   └── repeated-measures/
│   └── [course]/index.qmd  # Each course is a single comprehensive page
├── _site/                   # Rendered output
├── .claude/                 # Claude documentation and trackers
├── scripts/                 # R dependency checker and render wrapper
├── index.qmd               # Homepage
└── about.qmd               # About page
```

**Page organization:**
- Each course lives in `pages/[category]/[course-name]/index.qmd`
- Multiple blog posts consolidated into single comprehensive pages
- Each page may have a `references.bib` file for citations
- YAML frontmatter required: title, code-fold, warning, message, bibliography (if needed)

## Content Source and Relationship to jon-blog

**Important Context:**
- This site's content originated from Jon's blog (https://github.com/JonMinton/jon-blog)
- Multiple blog posts were consolidated into single pages here
- See `.claude/blog-to-site-mapping.md` for detailed mapping of which blog posts became which pages
- When adding Claude footnotes or making content updates, reference the jon-blog source for context

**Content Flow:**
1. Original content written as individual blog posts in jon-blog
2. Posts consolidated into comprehensive course pages in stats-site
3. Claude footnotes added to blog posts (connecting stats to ML/AI)
4. Same footnotes transferred to equivalent locations in stats-site pages
5. Both repos now maintained with consistent "Note from Claude:" annotations

## Page Conventions

**YAML frontmatter structure:**
```yaml
---
title: "Page Title"
code-fold: show
warning: false
message: false
bibliography: references.bib  # If page uses citations
---
```

**Internal linking:**
- Use relative paths from the page location: `../../main-course/intro-to-glms/index.qmd`
- For links within the same directory: `../other-course/index.qmd`
- Common pattern: Link to related courses or sections

**Markdown formatting:**

**CRITICAL - List formatting:** Bullet point lists in `.qmd` files MUST have blank lines before and after the entire list block, or they will not render properly. This is a common source of rendering errors.

Correct format:
```markdown
Here is some text before the list.

- Item one
- Item two
- Item three

Here is text after the list.
```

Incorrect format (will break rendering):
```markdown
Here is some text before the list.
- Item one
- Item two
- Item three
Here is text after the list.
```

Other formatting rules:
- Paragraph breaks require blank lines between paragraphs (markdown standard)
- Use `**bold**` for emphasis in bullet points when needed
- Links: `[Link text](url)` for external, `[Link text](../path/index.qmd)` for internal

**Images and media:**
- Store in the same directory as the page's `index.qmd`
- Reference with relative paths: `![Alt text](filename.png)`

**Footnotes:**

Quarto supports standard Markdown footnote syntax with two-part format:
- Reference in text: `Some text here[^id]`
- Definition elsewhere: `[^id]: Footnote content here`

**CRITICAL - Footnote ID Convention:**
- **ALWAYS use descriptive IDs** for Claude-generated footnotes
- Format: `[^claude-shorttopic]` (e.g., `[^claude-ml]`, `[^claude-pvalues]`)
- **NEVER use sequential numbers** ([^1], [^2]) for Claude footnotes - this creates collision risk with existing footnotes
- User's original footnotes may use numbers - descriptive IDs prevent conflicts

Example correct usage:
```markdown
The GLM framework applies to many models.[^claude-ml]

[^claude-ml]: **Note from Claude:** This concept is taught in Andrew Ng's ML course...
```

**Claude Footnote Convention:**
All Claude-generated footnotes should:
- Use descriptive IDs: `[^claude-topic]`
- Start with: `**Note from Claude:**`
- Connect traditional statistics to ML/AI applications and Python implementations
- Reference online courses, Python libraries, and modern ML practices

**Example Claude footnotes used in this site:**
- `[^claude-ml]` - ML frameworks and Python libraries
- `[^claude-activations]` - Link functions vs activation functions
- `[^claude-python]` - Python implementations (statsmodels, scikit-learn)
- `[^claude-interpretability]` - SHAP values and ML interpretability
- `[^claude-mle]` - MLE and loss functions
- `[^claude-optimizers]` - Optimization algorithms
- `[^claude-optimization]` - Marble/jumping bean → ML optimization
- `[^claude-causal]` - Causal inference libraries (DoWhy, CausalML)
- `[^claude-resampling]` - Bootstrapping and cross-validation
- `[^claude-pvalues]` - P-values vs cross-validation

**Bibliography citations:**
Footnotes can include bibliography citations using `@citationkey` format if the page has a `bibliography: references.bib` entry in the YAML frontmatter.

Example:
```markdown
[^claude-interpretability]: **Note from Claude:** The marginal effects approach connects
to @molnar2022interpretable which covers ML interpretability methods.
```

See `.claude/quarto-rendering-best-practices.md` for full details on footnote rendering and troubleshooting.

## Themes and Styling

The site uses dual themes configured in `_quarto.yml`:
- Light: cosmo
- Dark: slate
- Custom CSS: `styles.css`

## R Integration

This is primarily an R-based course site with Quarto. Pages contain R code chunks with statistical analyses, visualizations, and simulations demonstrating GLM concepts.

**R package dependencies:**
- The `scripts/` directory contains helper scripts:
  - `check-r-packages.R` - Checks if required R packages are installed
  - `render-with-checks.R` - Wrapper that checks dependencies before rendering

## Common Workflow Patterns

**Editing existing pages:**
- Pages are in `pages/**/**/index.qmd`
- After editing, render to see changes: `quarto preview` or `quarto render`
- Check for rendering warnings

**Adding Claude footnotes to pages:**
1. Identify the appropriate location in the text
2. Add footnote reference with descriptive ID: `text[^claude-topic]`
3. Add footnote definition: `[^claude-topic]: **Note from Claude:** content...`
4. If using bibliography citations, ensure `bibliography: references.bib` in YAML
5. Add citation entries to `references.bib` if needed
6. Verify rendering: `quarto render pages/path/to/page/index.qmd`

**Working with bibliography files:**
- Each page directory can have its own `references.bib`
- Use BibTeX format for all citations
- Claude footnotes added the following new citations:
  - `@molnar2022interpretable` - ML interpretability
  - `@murphy2022probabilistic` - Probabilistic ML
  - `@cunningham2021causal` - Causal Inference: The Mixtape
  - `@facure2022causal` - Causal Inference for The Brave and True
  - `@downey2014think` - Think Stats (computational statistics)
  - `@mcelreath2020statistical` - Statistical Rethinking
  - `@efron2016computer` - Computer Age Statistical Inference

## Troubleshooting Common Issues

### Duplicate or Missing Footnotes in Rendered Output

**Symptom:** Footnotes appear duplicated, missing, or incorrect in the rendered HTML even though the source `.qmd` file is correct.

**Cause:** Stale Quarto cache in `.quarto/` directory. When footnote IDs are changed (e.g., from `[^1]` to `[^claude-ml]`), the cached render state can conflict with the new source.

**Solution:**
```bash
# Clear cache for specific page
rm -rf .quarto/xref/[page-hash]

# Or clear all cache
rm -rf .quarto/*

# Re-render the page
quarto render pages/[path-to-page]/index.qmd
```

**When to use this fix:**
- After changing footnote IDs (numbered → descriptive)
- When footnotes appear duplicated in rendered output
- When user's footnotes are missing but Claude footnotes appear multiple times
- After resolving merge conflicts in pages with footnotes

**Prevention:** Starting each session current with origin/main (`git pull --ff-only`) reduces the need for retroactive footnote ID changes.

### Render Warnings

See `.claude/quarto-rendering-best-practices.md` for guidelines on which warnings are safe to ignore vs. those requiring immediate attention.

Common safe-to-ignore warnings:
- `Warning: program compiled against libxml 210 using older 209` - system library mismatch
- Package version warnings - cosmetic only
- Stale cache warnings after fixing footnote IDs

### Merge Conflicts

Rare now that all work happens on `main` (see Branch Workflow above). If one does arise, see `.claude/quarto-rendering-best-practices.md` — but note its branch-specific advice predates the retirement of `experimental/claude`. General principle: resolve source files (.qmd) by hand; generated files (_site/*, .quarto/*) can be regenerated by rendering, which should only be done when the user asks.

## Claude Documentation Files

The `.claude/` directory contains important documentation:

- `blog-to-site-mapping.md` - Maps which blog posts became which pages
- `quarto-rendering-best-practices.md` - Comprehensive guide to rendering, footnotes, and merge conflicts
- `typo-fixes-tracker.md` - Tracks typo corrections from blog to site
- `footnote-renumbering-*.md` - Documentation of footnote renumbering work
- `session-tracker.md` - Session history and progress tracking

## Related Repositories

**jon-blog** (https://github.com/JonMinton/jon-blog):
- Source of original content for this site
- Individual blog posts that were consolidated here
- Contains `.claude/` documentation with additional context
- Both repos use Quarto and share similar conventions
- Claude footnotes added to both repos for consistency
