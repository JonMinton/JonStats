# Blog to Stats Site Content Mapping

Generated: 2025-12-01

## Purpose

Track which blog posts map to which stats site pages to facilitate propagating typo fixes and corrections from the blog (last updated Nov 30, 2025) to this site (older content).

**Key Challenge**: Multiple blog posts were consolidated into single pages on stats site (not 1:1 mapping).

---

## Detailed Stats Site → Blog Post Mappings

### Main Course

#### [pages/main-course/intro-to-glms/index.qmd](pages/main-course/intro-to-glms/index.qmd)
**Blog Sources (4 posts consolidated):**
- Part 1: "Model fitting as parameter calibration"
- Part 2: "Systematic components and link functions"
- Part 3: "glm is just fancy lm"
- Part 4: "why only betas just look at betas"
- **Blog URLs**: https://jonminton.github.io/jon-blog/posts/glms/intro-to-glms/lms-are-glms-part-[01-04]/
- **Typo Status**: 5 typo corrections made across GLM posts in blog

#### [pages/main-course/likelihood-and-simulation-theory/index.qmd](pages/main-course/likelihood-and-simulation-theory/index.qmd)
**Blog Sources (6 posts consolidated):**
- Part 5: "Traversing the Likelihood Landscape"
- Part 6: "The Robo-Chauffeur"
- Part 7: "Feeling Uncertain"
- Part 8: "Guessing what a landscape looks like by feeling the curves beneath our feet"
- Part 9: "Answering questions with honest uncertainty"
- Part 10: "Log Likelihood estimation for Logistic Regression"
- **Blog URLs**: https://jonminton.github.io/jon-blog/posts/glms/likelihood-and-simulation-theory/lms-are-glms-part-[05-10]/

#### [pages/main-course/complete-simulation-example/index.qmd](pages/main-course/complete-simulation-example/index.qmd)
**Blog Sources (3 posts consolidated):**
- Part 11: "Honest Predictions the easier way"
- Part 12: "Honest Predictions the slightly-less easier way"
- Part 13: "On Marbles and Jumping Beans"
- **Blog URLs**: https://jonminton.github.io/jon-blog/posts/glms/complete-simulation-example/lms-are-glms-part-[11-13]/
- **Note**: Uses ToothGrowth dataset, frequentist vs Bayesian comparisons

#### [pages/main-course/statistics-as-circuits/index.qmd](pages/main-course/statistics-as-circuits/index.qmd)
**Blog Sources (1 post):**
- "Statistics as circuit boards" - simulation and systems thinking
- **Content**: Graphical mental models, circuit schematics for statistical inference

---

### Supplementary Courses

#### [pages/extra-courses/causal-inference/index.qmd](pages/extra-courses/causal-inference/index.qmd)
**Blog Sources (5 posts consolidated):**
- Part 14: "A non-technical but challenging introduction to causal inference"
- Part 15: "Causal Inference: The platinum and gold standards"
- Part 16: "Causal Inference: How to try to do the impossible"
- Part 17: "Causal Inference: Controlling and Matching Approaches"
- Part 18: "Causal Inference: Some closing thoughts"
- **Blog URLs**: https://jonminton.github.io/jon-blog/posts/glms/causal-inference/lms-are-glms-part-[14-18]/
- **Note**: Recent commits fixed broken links in parts 16 and 24
- **Key Content**: Henry Dundas counterfactual example, missing data perspective

#### [pages/extra-courses/time-series/index.qmd](pages/extra-courses/time-series/index.qmd)
**Blog Sources (7 posts consolidated):**
- Part 19: "Time Series: Introduction and Autoregression"
- Part 20: "Time Series: Integration"
- Part 21: "Time Series: The Moving Average Model"
- Part 22: "Time Series - ARIMA in practice"
- Part 23: "Time series and seasonality"
- Part 24: "Vector Autoregression and multivariate models"
- Part 25: "Time series - Some closing remarks"
- **Blog URLs**: https://jonminton.github.io/jon-blog/posts/glms/time-series/lms-are-glms-part-[19-25]/
- **Typo Status**: Zero errors found in time series posts (cleanest content!)

#### [pages/extra-courses/survival-analysis/index.qmd](pages/extra-courses/survival-analysis/index.qmd)
**Blog Sources (1 post):**
- "Time and (state) change: Some thoughts on Survival Modelling and Friends" (2025-03-30)
- **Blog URL**: https://jonminton.github.io/jon-blog/posts/glms/one-off/time-and-change/
- **Migrated**: 2026-07-31. Assets copied: `nltuk198020203.xlsx` (ONS lifetable), `competing-schedules.jpeg`
- **Site adaptations**: frontmatter aligned to site conventions; "previous posts" reference now links to the time series course; Bayesian/MCMC aside now links to complete-simulation-example
- **Key Content**: contingency tables → Markov models → absorbing states → survival → hazards/Weibull → lifetables → censoring → competing risks → discrete event simulation. Cox PH and Kaplan-Meier deliberately not covered

#### [pages/extra-courses/hacker-stats/index.qmd](pages/extra-courses/hacker-stats/index.qmd)
**Blog Sources (5 posts - main page consolidates all):**
- "Hacker Stats: Intro and overview"
- "Bootstrapping"
- "Permutation Testing with Base R"
- "Getting started with the infer package"
- "Resampling for post-stratification"
- **Blog URLs**: https://jonminton.github.io/jon-blog/posts/glms/hacker-stats/[topic-name]/

##### [pages/extra-courses/hacker-stats/bootstrapping/index.qmd](pages/extra-courses/hacker-stats/bootstrapping/index.qmd)
**Blog Source:** "Bootstrapping" (with replacement sampling)

##### [pages/extra-courses/hacker-stats/infer-introduction/index.qmd](pages/extra-courses/hacker-stats/infer-introduction/index.qmd)
**Blog Source:** "Getting started with the infer package" (four verbs: specify, hypothesize, generate, calculate)

##### [pages/extra-courses/hacker-stats/permutation-with-base-r/index.qmd](pages/extra-courses/hacker-stats/permutation-with-base-r/index.qmd)
**Blog Source:** "Permutation Testing with Base R" (without replacement sampling)

##### [pages/extra-courses/hacker-stats/post-stratification/index.qmd](pages/extra-courses/hacker-stats/post-stratification/index.qmd)
**Blog Source:** "Resampling for post-stratification" (reweighting techniques)

##### [pages/extra-courses/hacker-stats/resampling-approaches-intro/index.qmd](pages/extra-courses/hacker-stats/resampling-approaches-intro/index.qmd)
**Blog Source:** "Hacker Stats: Intro and overview" (resampling flowchart)

#### [pages/extra-courses/p-values-stat-sig/index.qmd](pages/extra-courses/p-values-stat-sig/index.qmd)
**Blog Sources (1 post):**
- "Demystifying and Disenchanting Statistical Significance"
- **Blog URL**: https://jonminton.github.io/jon-blog/posts/glms/one-off/p-values-stat-sig/
- **Key Content**: P-values as "cheap model pruning advice", data budgets, degrees of freedom, cult of significance

---

## Summary Statistics

| Stats Site Page | Blog Posts | Consolidation Ratio | Quality Notes |
|---|---|---|---|
| intro-to-glms | Parts 1-4 | 4:1 | 5 typos fixed in blog |
| likelihood-and-simulation-theory | Parts 5-10 | 6:1 | Maintained |
| complete-simulation-example | Parts 11-13 | 3:1 | Maintained |
| statistics-as-circuits | 1 post | 1:1 | Maintained |
| causal-inference | Parts 14-18 | 5:1 | Links fixed in blog |
| time-series | Parts 19-25 | 7:1 | Zero errors (cleanest!) |
| hacker-stats (main + 5 sub) | 5 posts | ~1:1 per page | Maintained |
| p-values-stat-sig | 1 post | 1:1 | Maintained |

**Total: 32 blog posts consolidated into 8 main stats site pages (13 including subpages)**

---

## Action Plan for Typo Propagation

### Phase 1: Verify Mappings ✓
1. ✓ Read each stats site page to understand its content
2. ✓ Search blog for matching content/posts
3. ✓ Confirm which blog posts were source material
4. ✓ Document specific blog post URLs for each stats site page

### Phase 2: Compare Content (COMPLETE)
For each stats site page, compare with blog source(s):
1. ✓ **High Priority**: Intro to GLMs (4 blog posts, 5 typos fixed) - **4 fixes applied**
2. ✓ **High Priority**: Causal Inference (5 blog posts, link fixes) - **3 fixes applied**
3. ✓ Likelihood and Simulation Theory (6 blog posts) - **1 fix applied**
4. ✓ Complete Simulation Example (3 blog posts) - **4 fixes applied**
5. **Low Priority**: Time Series (7 blog posts, already clean) - not checked (lowest priority)
6. ✓ Hacker Stats pages (5 blog posts, check each) - **verified clean, 0 fixes needed**
7. ✓ P-values and Statistical Significance (1 blog post) - **1 fix applied**
8. ✓ Statistics as Circuits (1 blog post) - **2 fixes applied**

### Phase 3: Apply Fixes
1. For each identified difference, decide: typo fix, content improvement, or intentional divergence
2. Apply typo fixes using Edit tool
3. Verify internal links still work
4. Test that changes don't break site structure
5. Document changes in commit message

---

## Priority Order for Review

1. **GLM Main Course** (5 typos fixed in blog)
   - intro-to-glms
   - likelihood-and-simulation-theory
   - complete-simulation-example

2. **Causal Inference** (link fixes in parts 16, 24)

3. **Time Series** (already clean, but verify)

4. **Hacker Stats** (multiple pages, check each)

5. **Other supplementary courses**

---

## Notes

- Blog branch: experimental/claude (Nov 30, 2025 updates)
- Blog URL pattern: https://jonminton.github.io/jon-blog/posts/[post-name]
- Stats site was last updated before Nov 30, 2025
- 45 typos fixed across 130 blog posts (~0.35 per post)
- GLM posts had 5 specific corrections
- Time series had 0 errors (cleanest)
