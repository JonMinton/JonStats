# Scripts for Stats Site Maintenance

This directory contains utility scripts for maintaining the stats site.

## R Package Dependency Checker

### check-r-packages.R

Scans all `.qmd` files in the project to identify required R packages and checks if they are installed.

**Usage:**

```bash
# Check for missing packages (without installing)
Rscript scripts/check-r-packages.R

# Check and automatically install missing packages
Rscript scripts/check-r-packages.R --install

# Verbose output showing which files need which packages
Rscript scripts/check-r-packages.R --verbose

# Combine options
Rscript scripts/check-r-packages.R --install --verbose
```

**Exit codes:**
- `0` - All packages are installed (or successfully installed)
- `1` - Missing packages found (when not using --install)

**Example output:**

```
Found 45 .qmd files to scan

Found 15 unique packages required:
- MASS
- dplyr
- forecast
- ggplot2
- rstanarm
...

✓ All required R packages are installed
```

Or if packages are missing:

```
✗ Missing 2 package(s):
- forecast
- rstanarm

To install missing packages, run:
  Rscript scripts/check-r-packages.R --install
```

### render-with-deps.sh

Wrapper script that checks for R dependencies before running `quarto render`. Automatically installs missing packages before attempting to render.

**Usage:**

```bash
# Render entire site with dependency checking
./scripts/render-with-deps.sh

# Render specific file with dependency checking
./scripts/render-with-deps.sh pages/main-course/intro-to-glms/index.qmd

# Pass any quarto render options
./scripts/render-with-deps.sh --to html
```

**What it does:**
1. Runs `check-r-packages.R --install` to ensure all packages are available
2. If packages install successfully, runs `quarto render` with any provided arguments
3. Reports success or failure

**Example output:**

```
🔍 Checking R package dependencies...

Found 45 .qmd files to scan
Found 15 unique packages required

Installing missing packages...
Installing forecast... ✓
Installing rstanarm... ✓

Installation complete

✓ All dependencies satisfied

🚀 Starting Quarto render...

[Quarto render output...]

✓ Render complete
```

## Integration with CI/CD

To use these scripts in GitHub Actions or other CI environments:

```yaml
- name: Check and install R dependencies
  run: Rscript scripts/check-r-packages.R --install

- name: Render Quarto site
  run: quarto render
```

Or use the wrapper script:

```yaml
- name: Render with dependency checking
  run: ./scripts/render-with-deps.sh
```

## Notes

- The scripts scan for `library()` calls in `.qmd` files using regex
- Packages are installed from CRAN (`https://cloud.r-project.org`)
- The script does not handle:
  - Packages loaded with `require()`
  - Packages accessed via `::` without explicit loading
  - Bioconductor or GitHub packages
  - Version requirements

For more complex dependency management, consider using `renv` for project-specific package management.
