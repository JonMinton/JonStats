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
- **Supplementary Courses**: Causal inference, time series, survival analysis, hacker stats, p-values

(A repeated-measures page was formerly staged in `pages/extra-courses/repeated-measures/` as raw blog material — an untranscribed handwritten scan. Those assets were removed in July 2026; the blog post remains the source if that page is ever developed properly.)

**Key Difference from jon-blog:** This site consolidates multiple blog posts into single comprehensive pages, making internal linking and content organization different from the blog.

## Building and Rendering

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

**Images and media:**
- Store in the same directory as the page's `index.qmd`
- Reference with relative paths: `![Alt text](filename.png)`

**Footnotes:**

Claude footnotes use descriptive IDs (`[^claude-topic]`), **never** sequential numbers — load the `claude-footnotes` skill (`.claude/skills/claude-footnotes/SKILL.md`) before adding or editing any footnotes or bibliography entries.

## Common Workflow Patterns

Footnote-adding and bibliography workflows live in the `claude-footnotes` skill.

## Troubleshooting Common Issues

### Duplicate or Missing Footnotes in Rendered Output

Stale Quarto cache in `.quarto/` — see the `claude-footnotes` skill for symptoms, the cache-clearing fix, and prevention.

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
