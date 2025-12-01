# Complete Footnote Renumbering Plan

Generated: 2025-12-01

## Executive Summary

**Problem**: Two pages have duplicate footnote IDs that prevent correct navigation from text to footnotes.

**Pages affected**:
1. **complete-simulation-example/index.qmd**: 8 unique footnotes, 3 duplicates ([^1] appears 3 times, [^2] appears 2 times)
2. **intro-to-glms/index.qmd**: 7 unique footnotes, 1 duplicate ([^1] appears 2 times)

**Solution**: Renumber all footnotes sequentially (1 through N) on each page.

---

## Page 1: Complete Simulation Example

**File**: [pages/main-course/complete-simulation-example/index.qmd](pages/main-course/complete-simulation-example/index.qmd)

### Problem Analysis

This page consolidates 3 blog posts (Parts 11-13). Each original post had its own footnote numbering starting from [^1], creating conflicts when combined.

### Current Structure

| Line | Current ID | Content Summary | Blog Origin |
|------|------------|-----------------|-------------|
| 60 | [^1] | Logarithmic spacing (doublings) | Part 11 |
| 83 | [^2] | Model comparison limitations | Part 11 |
| 146 | [^3] | Nested/restricted models | Part 11 |
| 498 | [^1] **DUP** | Simulation approximations vary | Part 12 |
| 506 | [^2] **DUP** | Random seeds in simulations | Part 12 |
| 678 | [^1] **DUP** | Bayesian statistics/MCMC | Part 13 |
| 687 | [^4] | BUGS "ominously named" | Part 13 |
| 713 | [^5] | rstanarm dependencies | Part 13 |

### Proposed Renumbering (Sequential 1-8)

| Line | Old ID | New ID | Content | Action |
|------|--------|--------|---------|---------|
| 60 | [^1] | [^1] | Logarithmic spacing | **Keep** |
| 83 | [^2] | [^2] | Model comparison | **Keep** |
| 146 | [^3] | [^3] | Nested models | **Keep** |
| 498 | [^1] | **[^4]** | Simulation approximations | **Change** |
| 506 | [^2] | **[^5]** | Random seeds | **Change** |
| 678 | [^1] | **[^6]** | Bayesian MCMC | **Change** |
| 687 | [^4] | **[^7]** | BUGS name | **Change** |
| 713 | [^5] | **[^8]** | rstanarm dependencies | **Change** |

### Changes Required

**Reference changes** (in main text):
- Line 498: `[^1]` → `[^4]`
- Line 506: `[^2]` → `[^5]`
- Line 678: `[^1]` → `[^6]`
- Line 687: `[^4]` → `[^7]`
- Line 713: `[^5]` → `[^8]`

**Definition changes** (footnote bodies):
- Line 500: `[^1]:` → `[^4]:`
- Line 510: `[^2]:` → `[^5]:`
- Line 680: `[^1]:` → `[^6]:`
- Line 689: `[^4]:` → `[^7]:`
- Line 715: `[^5]:` → `[^8]:`

---

## Page 2: Intro to GLMs

**File**: [pages/main-course/intro-to-glms/index.qmd](pages/main-course/intro-to-glms/index.qmd)

### Problem Analysis

This page consolidates 4 blog posts (Parts 1-4). The duplicate [^1] occurs because Part 1 and Part 4 each had their own [^1] footnote.

### Current Structure

| Line | Current ID | Content Summary | Blog Origin |
|------|------------|-----------------|-------------|
| 136 | [^1] | Base R graphics ("feeling masochistic") | Part 1 or 2 |
| 292 | [^1] **DUP** | Notation: subscript i vs j | Part 4 |
| 292 | [^2] | Expectation operator E(.) | Part 4 |
| 438 | [^3] | Divide-by-four derivation (long) | Part 4 |
| 442 | [^4] | Coefficients less than four | Part 4 |
| 444 | [^5] | Lower bound is zero | Part 4 |
| 460 | [^6] | expand_grid vs expand.grid | Part 4 |

### Proposed Renumbering (Sequential 1-7)

| Line | Old ID | New ID | Content | Action |
|------|--------|--------|---------|---------|
| 136 | [^1] | [^1] | Base R graphics | **Keep** |
| 292 | [^1] | **[^2]** | Notation (subscripts) | **Change** |
| 292 | [^2] | **[^3]** | Expectation operator | **Change** |
| 438 | [^3] | **[^4]** | Divide-by-four | **Change** |
| 442 | [^4] | **[^5]** | Coefficients < 4 | **Change** |
| 444 | [^5] | **[^6]** | Lower bound zero | **Change** |
| 460 | [^6] | **[^7]** | expand_grid | **Change** |

### Changes Required

**Reference changes** (in main text):
- Line 292: First `[^1]` → `[^2]` (notation footnote)
- Line 292: `[^2]` → `[^3]` (expectation operator)
- Line 438: `[^3]` → `[^4]`
- Line 442: `[^4]` → `[^5]`
- Line 444: `[^5]` → `[^6]`
- Line 460: `[^6]` → `[^7]`

**Definition changes** (footnote bodies):
- Line 138: `[^1]:` → **Keep as [^1]:**
- Line 294: `[^1]:` → `[^2]:`
- Line 296: `[^2]:` → `[^3]:`
- Line 440: `[^3]:` → `[^4]:`
- Line 442: `[^4]:` → `[^5]:`
- Line 446: `[^5]:` → `[^6]:`
- Line 462: `[^6]:` → `[^7]:`

---

## Implementation Strategy

### Phase 1: User Approval
Present this plan to user for review before making changes.

### Phase 2: Apply Changes (if approved)
**Order of operations** (to avoid creating new conflicts):
1. Start with highest numbers, work backwards
2. Change definitions first, then references
3. Do one page at a time

**For complete-simulation-example**:
1. Change [^5] → [^8] (definition line 715, reference line 713)
2. Change [^4] → [^7] (definition line 689, reference line 687)
3. Change [^1] at line 678 → [^6] (definition line 680, reference line 678)
4. Change [^2] at line 506 → [^5] (definition line 510, reference line 506)
5. Change [^1] at line 498 → [^4] (definition line 500, reference line 498)

**For intro-to-glms**:
1. Change [^6] → [^7] (definition line 462, reference line 460)
2. Change [^5] → [^6] (definition line 446, reference line 444)
3. Change [^4] → [^5] (definition line 442, reference line 442)
4. Change [^3] → [^4] (definition line 440, reference line 438)
5. Change [^2] → [^3] (definition line 296, reference line 292)
6. Change [^1] at line 292 → [^2] (definition line 294, reference line 292)

### Phase 3: Verification
1. Run `quarto render`
2. Verify footnote warnings are resolved
3. Check that footnote links navigate correctly
4. Commit with detailed message

---

## Expected Outcome

After renumbering:
- ✅ All footnote IDs unique within each page
- ✅ Sequential numbering 1 through N
- ✅ Clicking footnote references navigates to correct footnote
- ✅ No Quarto duplicate footnote warnings

---

## Notes

- **Critical**: Line 292 in intro-to-glms has TWO footnote references in the same sentence - must change both
- **Order matters**: Renumber from highest to lowest to avoid creating temporary duplicates
- **Each page independent**: Numbering restarts at [^1] for each .qmd file (this is correct)
- **Blog consolidation**: Root cause is merging multiple posts with separate footnote sequences
