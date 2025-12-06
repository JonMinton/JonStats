# Quarto Rendering Best Practices

**Source:** Adapted from jon-blog repo's Claude documentation
**Date:** 2025-12-06

## Key Learnings from jon-blog

### 1. Footnote Rendering Issues

#### Problem: Footnotes Not Appearing
Two common causes:
1. **Stale rendered output** - Footnotes exist in source but need `quarto render` to appear
2. **Duplicate footnote IDs** - Numbered footnotes ([^1], [^2]) conflict with existing ones

#### Solution: Use Descriptive Footnote IDs

**❌ DON'T use numbered IDs for Claude footnotes:**
```markdown
Some text.[^1]

[^1]: **Note from Claude:** Content...
```

**✅ DO use descriptive IDs with `claude-` prefix:**
```markdown
Some text.[^claude-ml]

[^claude-ml]: **Note from Claude:** Content...
```

#### Why Descriptive IDs?
- **No collision risk** - Won't conflict with existing numbered footnotes
- **Self-documenting** - Clear what the footnote is about
- **Future-proof** - Easy to add more without checking existing numbers
- **Supported by Quarto** - Any alphanumeric string with hyphens works

#### Naming Convention
Format: `[^claude-shorttopic]`

Examples:
- `[^claude-ml]` - Machine learning concepts
- `[^claude-python]` - Python implementations
- `[^claude-interpretability]` - ML interpretability methods
- `[^claude-optimizers]` - Optimization algorithms
- `[^claude-causal]` - Causal inference
- `[^claude-resampling]` - Resampling methods
- `[^claude-pvalues]` - P-values and model selection

### 2. Bibliography Citations in Footnotes

Claude footnotes CAN reference bibliography entries:

```markdown
[^claude-ml]: **Note from Claude:** The marginal effects approach connects to
@molnar2022interpretable which covers ML interpretability.
```

**Requirements:**
- YAML frontmatter has `bibliography: references.bib`
- Citation exists in `references.bib` file in same directory

### 3. Verification After Adding Footnotes

**Always verify footnotes render correctly:**

1. Run `quarto render path/to/file.qmd` or `quarto preview`
2. Check HTML output - footnote should appear
3. Check for warnings about duplicate references
4. If issues: check source for duplicate IDs

**Example verification:**
```bash
# Test render a single file
quarto render pages/main-course/intro-to-glms/index.qmd

# Search for potential duplicate IDs
grep -n "\[^1\]" path/to/file.qmd
```

---

## Merge Conflict Prevention

### The Problem

Merge conflicts occur in two types of files:
1. **Auto-generated files** (_freeze/*, docs/search.json, docs/sitemap.xml)
2. **Source files** (.qmd) when both branches modify same content

### Solutions

#### 🥇 Best: Keep experimental/claude synced with main

**Before starting work:**
```bash
git checkout experimental/claude
git fetch origin
git merge origin/main
```

**Why:** Minimizes divergence, makes eventual merge straightforward

#### 🥈 Good: Commit source only, render on main

**Workflow:**
1. On experimental/claude: Edit .qmd files, commit (don't render)
2. Merge to main
3. On main: Run `quarto render` after merge

**Why:** Eliminates conflicts in generated files

**Modified approach if you need to verify:**
```bash
# On experimental/claude
quarto preview    # Check locally, don't commit render
git add pages/**/*.qmd .claude/*
git commit -m "message"
```

#### 🥉 Helpful: Use .gitignore for volatile files

Add to `.gitignore`:
```
_freeze/
docs/search.json
docs/sitemap.xml
```

**Why:** These files change on every render (timestamps), causing conflicts

**Keep in version control:**
```
docs/**/*.html
docs/**/*.png
docs/**/*.jpg
```

### Recommended Combined Approach

1. **Starting work:**
   ```bash
   git checkout experimental/claude
   git pull origin main
   ```

2. **Making changes:**
   - Edit .qmd, .md, references.bib files
   - Use `quarto preview` to check locally
   - Commit source only:
     ```bash
     git add pages/**/*.qmd .claude/*.md
     git commit -m "Descriptive message"
     ```

3. **After merging to main:**
   ```bash
   git checkout main
   quarto render
   git add docs/
   git commit -m "Regenerate docs after merge"
   ```

---

## Known Safe-to-Ignore Warnings

### libxml version warning
```
Warning: program compiled against libxml 210 using older 209
```
**Status:** Safe to ignore - system library mismatch, doesn't affect output

### Package version warnings
```
package 'X' was built under R version X.X.X
```
**Status:** Safe to ignore - cosmetic warning

### Duplicate note reference (after fixing)
If you see this after converting to descriptive IDs, it's likely stale cache.

**Verify:**
```bash
grep -n "\[^N\]" path/to/file.qmd
# Should only show 1 reference + 1 definition
```

If truly only one instance exists, the warning is stale and will disappear on next clean render.

---

## When to Fix Immediately

1. **Duplicate footnote references** - footnotes won't render correctly
2. **Missing file references** - broken links
3. **Bibliography errors** - citations won't work

---

## Quick Troubleshooting

### Footnote not appearing in rendered output?

1. Check source has both reference and definition
2. Search for duplicate IDs: `grep -n "\[^id\]" file.qmd`
3. Verify bibliography file exists if using @citations
4. Re-render: `quarto render path/to/file.qmd`

### Merge conflict in rendered files?

```bash
# Accept experimental/claude version for source files
git checkout --theirs path/to/file.qmd

# Accept experimental/claude version for generated files
git checkout --theirs docs/path/to/file.html

# Then regenerate everything
quarto render
```

---

## For Future Claude Agents

**When adding footnotes:**
1. ✅ Use `[^claude-topic]` format
2. ✅ Check if `bibliography:` exists before using `@citations`
3. ✅ Run `quarto render` to verify appearance
4. ❌ Never use numbered IDs like `[^1]` for Claude footnotes
5. ❌ Don't assume footnotes render without checking

**When starting work:**
1. ✅ Run `git pull origin main` to sync experimental/claude
2. ✅ Test with `quarto preview` before committing
3. ✅ Commit source files, optionally skip render output
4. ✅ Document breaking changes in commit messages

**When helping with merges:**
1. ✅ Accept experimental/claude for source conflicts (`--theirs`)
2. ✅ Accept experimental/claude for generated files, then re-render
3. ✅ Verify: `git status` should be clean after resolution
