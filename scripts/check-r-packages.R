#!/usr/bin/env Rscript
# R Package Dependency Checker for Quarto Project
#
# This script scans all .qmd files in the project for library() calls,
# identifies which R packages are required, checks which are installed,
# and optionally installs missing packages.
#
# Usage:
#   Rscript scripts/check-r-packages.R [--install] [--verbose]
#
# Options:
#   --install    Automatically install missing packages
#   --verbose    Show detailed output

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
auto_install <- "--install" %in% args
verbose <- "--verbose" %in% args

# Get all .qmd files in the project
qmd_files <- list.files(
  path = ".",
  pattern = "\\.qmd$",
  recursive = TRUE,
  full.names = TRUE
)

if (verbose) {
  cat(sprintf("Found %d .qmd files to scan\n", length(qmd_files)))
}

# Function to extract library() calls from a file
extract_library_calls <- function(file_path) {
  tryCatch({
    content <- readLines(file_path, warn = FALSE)

    # Match library(package) or library("package") or library('package')
    library_pattern <- "library\\(\\s*['\"]?([a-zA-Z0-9._]+)['\"]?\\s*\\)"

    matches <- regmatches(content, gregexpr(library_pattern, content, perl = TRUE))
    packages <- character(0)

    for (match_list in matches) {
      if (length(match_list) > 0 && match_list[1] != "") {
        # Extract package names from library() calls
        pkg_names <- sub(library_pattern, "\\1", match_list, perl = TRUE)
        packages <- c(packages, pkg_names)
      }
    }

    return(unique(packages))
  }, error = function(e) {
    if (verbose) {
      cat(sprintf("Warning: Could not read %s: %s\n", file_path, e$message))
    }
    return(character(0))
  })
}

# Scan all files for packages
all_packages <- character(0)
file_packages <- list()

for (file in qmd_files) {
  packages <- extract_library_calls(file)
  if (length(packages) > 0) {
    file_packages[[file]] <- packages
    all_packages <- c(all_packages, packages)
  }
}

# Get unique list of packages
required_packages <- sort(unique(all_packages))

if (verbose) {
  cat(sprintf("\nFound %d unique packages required:\n", length(required_packages)))
  cat(paste("-", required_packages), sep = "\n")
  cat("\n")
}

# Check which packages are installed
installed_packages <- rownames(installed.packages())
missing_packages <- setdiff(required_packages, installed_packages)

# Report results
if (length(missing_packages) == 0) {
  cat("✓ All required R packages are installed\n")
  quit(status = 0)
} else {
  cat(sprintf("✗ Missing %d package(s):\n", length(missing_packages)))
  cat(paste("-", missing_packages), sep = "\n")

  # Show which files need each missing package
  if (verbose) {
    cat("\nFiles requiring missing packages:\n")
    for (pkg in missing_packages) {
      cat(sprintf("\n%s:\n", pkg))
      for (file in names(file_packages)) {
        if (pkg %in% file_packages[[file]]) {
          cat(sprintf("  - %s\n", file))
        }
      }
    }
  }

  # Install if requested
  if (auto_install) {
    cat("\nInstalling missing packages...\n")
    for (pkg in missing_packages) {
      cat(sprintf("Installing %s...", pkg))
      tryCatch({
        install.packages(pkg, repos = "https://cloud.r-project.org", quiet = !verbose)
        cat(" ✓\n")
      }, error = function(e) {
        cat(sprintf(" ✗ Failed: %s\n", e$message))
      })
    }
    cat("\nInstallation complete\n")
    quit(status = 0)
  } else {
    cat("\nTo install missing packages, run:\n")
    cat(sprintf("  Rscript scripts/check-r-packages.R --install\n\n"))
    quit(status = 1)
  }
}
