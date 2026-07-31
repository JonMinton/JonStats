# Blog Post Recommendations for Stats Site Promotion

Generated: 2025-12-01

## Overview

This document tracks potential blog posts from [Jon's Blog](https://jonminton.github.io/jon-blog/) that could be promoted to the [JonStats site](https://jonminton.github.io/stats-site/).

**Note**: Various small tweaks (typos etc) have been made to posts in the blog's experimental/claude branch. Review commits at: https://github.com/JonMinton/jon-blog/tree/experimental/claude

---

## High Priority - Strong Fits

### 1. Demystifying and Disenchanting Statistical Significance
- **Rationale**: Could expand existing P-Values and Statistical Significance section
- **Integration Point**: `pages/extra-courses/p-values-stat-sig/index.qmd`
- **Complements**: Hacker stats material

### 2. Point estimates, Confidence Intervals and P-Values (with animations)
- **Rationale**: Visual/interactive content enhances main course
- **Integration Point**: Main course or new visualization section
- **Strength**: Bridges conceptual understanding with technical implementation

### 3. Repeated Measures (multi-level modelling, random effects)
- **Rationale**: Natural extension of GLM main course
- **Integration Point**: New section in main course or supplementary course
- **Gap Filled**: Important statistical topic not yet covered
- **Status**: Staged assets (raw blog copy with untranscribed handwritten scan) removed from `pages/extra-courses/repeated-measures/` on 2026-07-31. Blog post remains the source; a proper page needs the handwriting transcribed first

### 4. Time and (state) change (survival modelling, Markov models) ✅ DONE
- **Rationale**: Related to but distinct from existing time series content
- **Integration Point**: New supplementary course or addition to time series
- **Scope**: Survival analysis, state transition models
- **Status**: Migrated 2026-07-31 as `pages/extra-courses/survival-analysis/index.qmd`, listed in Supplementary Courses sidebar after Time Series

### 5. Factor Analysis Posts
- "Factor analysis with ordinal variables"
- "How factor analysis is used in testing"
- **Rationale**: Forms coherent new supplementary course
- **Integration Point**: New section under supplementary courses
- **Scope**: Ordinal data, testing applications

---

## Medium Priority - Good Extensions

### 6. Additional GLM Series Posts (Parts 1-25)
- **Current Coverage**: Parts 1-4 (intro, link functions)
- **Blog Coverage**: Parts 1-25 including:
  - Parts 5-10: Likelihood estimation, logistic regression
  - Parts 11-13: Predictions, Bayesian approaches
  - Parts 14-18: Causal inference methods (some already on site)
  - Parts 19-25: Time series (autoregression, ARIMA, seasonality, VAR)
- **Action**: Review for gaps in existing main course content
- **Integration Point**: Expand existing main course sections

### 7. Interactive Sliders with Crosstalk and Plotly
- **Rationale**: Technical tutorial on visualization tools
- **Integration Point**: New "Data Visualization" or "R Tools" section
- **Type**: Practical implementation guide

### 8. Scientific Illustrations: Annotating the unit circle
- **Rationale**: Graphics/visualization supporting teaching
- **Integration Point**: Could support existing course materials
- **Type**: Technical graphics tutorial

---

## Lower Priority - Consider for Future

### 9. Tidy Tuesday Posts (13+ exploratory analyses)
- **Examples**: American Idol, Olympics, Women's Football, Space objects, etc.
- **Rationale**: Applied examples showing methods in action
- **Consideration**: May be too blog-like for "mature" stats site
- **Potential Use**: Case studies or worked examples appendix

### 10. Climbing with Claude: Understanding Collaborative Version Control
- **Category**: Software development adjacent
- **Rationale**: Relevant for reproducible research
- **Consideration**: Less directly statistical

---

## Content Gaps Identified

### New Sections Recommended

1. **Multi-level/Hierarchical Models**
   - Source: Repeated measures content
   - Fits with: GLM framework

2. **Survival Analysis**
   - Source: Time and state change content
   - Distinct from: Existing time series section

3. **Factor Analysis**
   - Source: Ordinal variables, testing applications posts
   - Type: Measurement and latent variables

4. **Advanced Statistical Concepts**
   - Source: Animations and interactive explanations
   - Focus: Pedagogical visualizations

---

## Current Stats Site Structure

### Main Course: Statistical Inference and Simulation
- (0) Statistics as Circuit Boards ✓
- (1) Intro to GLMs ✓
- (2) Likelihood and Simulation Theory ✓
- (3) Complete Simulation Example ✓

### Supplementary Courses
- Causal Inference ✓
- Time Series ✓
- Hacker Stats ✓
  - Bootstrapping ✓
  - Infer introduction ✓
  - Permutation with base R ✓
  - Post-stratification ✓
  - Resampling approaches intro ✓
- P-Values and Statistical Significance ✓

---

## Blog Posts Inventory (Statistics & Methods)

### Complete GLM Series
- Parts 1-13, 18, 20-25 covering full spectrum of GLM topics

### Hacker Stats & Resampling (Already on site)
- Intro and overview ✓
- Brief introduction to bootstrapping ✓
- Permutation Testing and intuition of Null hypothesis ✓
- Getting started with infer package ✓
- Resampling for post-stratification ✓

### Hypothesis Testing & Inference
- Demystifying and Disenchanting Statistical Significance
- Repeated Measures
- Time and (state) change

### Statistical Concepts
- Factor analysis with ordinal variables
- How factor analysis is used in testing
- Statistics as circuit boards ✓ (already on site)
- Point estimates, Confidence Intervals and P-Values

---

## Recent Blog Updates (experimental/claude branch)

### Statistics Content Updates

**Repeated Measures Post** (Jun 17, 2025)
- Commit: a5997cc9e343b6a71ab911a33e5142aa92d336b7
- Added content on repeated measures statistical methods
- **Action**: HIGH PRIORITY - This is new content matching recommendation #3

**GLMs Series Maintenance** (Nov 30, 2025)
- Multiple commits addressing broken internal links within GLM post series
- Fixed navigation between "intro-to-glms" and "complete-simulation-example"
- **Action**: Review for any content improvements beyond link fixes

### Quality Improvements (Nov 30, 2025)

**Comprehensive Content Review**
- Commit: ca5211f3543c65b631ccdc40995765d84f742ed3
- Fixed 45 typos across 130 posts (~0.35 typos per post)
- GLM posts: 5 typo corrections
- Time-series posts: zero errors found
- **Action**: Blog posts are now cleaner than before; good time to promote

**Link Infrastructure Repairs**
- Fixed broken cross-references in lms-are-glms series (parts 16 and 24)
- Restored functionality for time-series content navigation
- **Action**: Verify internal links when migrating content

### Key Findings

1. **Repeated Measures post is ready**: Recent addition (Jun 2025) to blog
2. **Quality improvements complete**: Typo fixes mean blog content is polished
3. **GLM series is well-maintained**: Links fixed, ready for review/migration
4. **Time series content is clean**: Zero errors reported

---

## Next Steps

1. ✓ Review experimental/claude branch commits for content updates
2. ✓ Identify which blog posts have received recent refinements
3. **TOP PRIORITY**: Identify and propagate typo fixes/corrections from blog to stats site
   - Blog was last updated yesterday (Nov 30, 2025) with 45 typo fixes
   - Stats site content is older and will contain these typos
   - Note: Multiple blog posts were combined into single pages here (not 1:1 mapping)
   - Need to map blog → stats site pages, compare content, apply fixes
4. **Secondary Priority**: Migrate Repeated Measures post (newly added, high priority)
5. For high-priority posts, check blog source files for latest version
6. Decide on integration strategy (new sections vs expansion of existing)
7. Create plan for systematic content migration

---

## Notes

- Blog serves as "staging post" for new material
- Stats site contains "mature" promoted content
- Consider version control: track which blog version was promoted
- May need to adapt blog posts for stats site structure/style
- **Recent blog maintenance (Nov-Dec 2025) makes this a good time to promote content**
- Blog posts on experimental/claude branch have been cleaned and links fixed
