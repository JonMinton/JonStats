# Footnote Renumbering Plan

Generated: 2025-12-01

## Purpose

Resolve duplicate footnote ID warnings by renumbering footnotes sequentially across consolidated pages. While Quarto renders these correctly, duplicate IDs prevent readers from navigating to the correct footnote when clicking references in the main text.

---

## Analysis Summary

**Pages with duplicate footnotes**: 2 (not 3 as initially reported)
- complete-simulation-example/index.qmd: 7 unique footnotes, duplicates at lines 498, 678
- intro-to-glms/index.qmd: Need to analyze

**Status**: The warnings mentioned 4 duplicates, but I need to verify the actual structure.

---

## Page 1: Complete Simulation Example

**File**: pages/main-course/complete-simulation-example/index.qmd

### Current Footnote Structure

This page consolidates 3 blog posts (Parts 11-13), resulting in duplicate footnote numbers:

**Section 1: Parts 11-12 content (Model building and Frequentist predictions)**
- Line 60: `[^1]` - About logging dose (doublings vs absolute difference)
- Line 83: `[^2]` - About comparing models with same dataset
- Line 146: `[^3]` - About nested/restricted models in F-tests

**Section 2: Part 12 content (Simulation-based predictions)**
- Line 498: `[^1]` **DUPLICATE** - About simulation approximations varying
- Line 506: `[^2]` **DUPLICATE** - About random seeds in simulations

**Section 3: Part 13 content (Bayesian modeling)**
- Line 678: `[^1]` **DUPLICATE** - About Bayesian statistics/MCMC
- Line 687: `[^4]` - About BUGS being "ominously named"
- Line 713: `[^5]` - About rstanarm having many dependencies

### Content Analysis

**First [^1] (line 60)**: Explains logarithmic spacing
> "The difference between 0.5mg and 1.0mg is 0.5mg, but it's also *one doubling*..."

**First [^2] (line 83)**: Explains model comparison limitations
> "These metrics can be used to compare different linear regression model specifications..."

**[^3] (line 146)**: Explains nested models
> "In this example, our more complex model has coefficients fit from the data..."

**Second [^1] (line 498)**: Explains simulation variability
> "These are the values produced the first time I ran the simulation..."

**Second [^2] (line 506)**: Explains random seeds
> "Because the simulation approach relies on random numbers..."

**Third [^1] (line 678)**: Explains Bayesian MCMC
> "Or perhaps more accurately Bayesian statistical model estimation rather than Bayesian statistics..."

**[^4] (line 687)**: Joke about BUGS name
> "Ominously named."

**[^5] (line 713)**: About rstanarm
> "`rstanarm` has a lot of dependencies. It's the friendly, cuddly face of a *beast*!"

### Proposed Renumbering

**Sequential numbering 1-8**:

1. Line 60: Keep as `[^1]` - Logarithmic spacing
2. Line 83: Keep as `[^2]` - Model comparison
3. Line 146: Keep as `[^3]` - Nested models
4. Line 498: Change to `[^4]` - Simulation approximations
5. Line 506: Change to `[^5]` - Random seeds
6. Line 678: Change to `[^6]` - Bayesian MCMC
7. Line 687: Change to `[^7]` - BUGS name (was [^4])
8. Line 713: Change to `[^8]` - rstanarm dependencies (was [^5])

### Implementation

**References to update**:
- Line 498: `[^1]` → `[^4]`
- Line 500: `[^1]:` definition → `[^4]:`
- Line 506: `[^2]` → `[^5]`
- Line 510: `[^2]:` definition → `[^5]:`
- Line 678: `[^1]` → `[^6]`
- Line 680: `[^1]:` definition → `[^6]:`
- Line 687: `[^4]` → `[^7]`
- Line 689: `[^4]:` definition → `[^7]:`
- Line 713: `[^5]` → `[^8]`
- Line 715: `[^5]:` definition → `[^8]:`

---

## Page 2: Intro to GLMs

**File**: pages/main-course/intro-to-glms/index.qmd

### Current Footnote Structure

This page consolidates 4 blog posts (Parts 1-4). Footnotes are mostly sequential but have a gap ([^1], [^2], [^3], [^4], [^5], [^6]) - no actual duplicates!

**Footnote inventory**:
- Line 136: `[^1]` - About using base R graphics
- Line 292: Two references `[^1]` and `[^2]` - About notation (subscripts i vs j) and expectation operator
- Line 438: `[^3]` - Long derivation of divide-by-four rule
- Line 442: `[^4]` - About coefficients less than four
- Line 444: `[^5]` - About lower bound being zero
- Line 460: `[^6]` - About expand_grid vs expand.grid

### Analysis

**WAIT** - There appear to be **TWO different [^1] references**:
1. Line 136: First `[^1]` - About base R graphics
2. Line 292: Second `[^1]` - About notation

And **TWO different [^2] references**:
1. Line 292: First `[^2]` appears in same sentence as second `[^1]`
2. Need to check if there's a second `[^2]` elsewhere

Let me verify the actual structure more carefully...

### Content Analysis

**First [^1] (line 136)**: About graphics
> "Using some base R graphics functions as I'm feeling masochistic"

**First [^2] (line 292)**: Appears as second footnote in same sentence
> Need to read definition

Actually, looking at line 292, it has BOTH `[^1]` and `[^2]` in the SAME line. This suggests:
- Line 136 has a `[^1]`
- Line 292 has `[^1]` (duplicate!) and `[^2]`
- Then continues with [^3], [^4], [^5], [^6]

### Proposed Renumbering

Need to read footnote definitions to understand content before proposing changes.

**ACTION NEEDED**: Read lines 138, 294, 296 to see footnote definitions.

---

## Implementation Steps

1. **Analyze remaining page** (intro-to-glms)
2. **Create detailed plans** for each page
3. **User approval** before making changes
4. **Apply changes** using Edit tool
5. **Test** with `quarto render`
6. **Commit** with detailed message

---

## Notes

- Footnotes are a navigation feature - duplicate IDs break the link from text to footnote
- Each consolidated page needs sequential numbering from 1 to N
- Definitions must be renumbered to match their references
- Original blog posts had separate numbering; consolidation created conflicts
