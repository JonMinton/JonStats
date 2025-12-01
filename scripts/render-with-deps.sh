#!/bin/bash
# Wrapper script to check R dependencies before rendering Quarto site
#
# Usage: ./scripts/render-with-deps.sh [quarto render options]

set -e  # Exit on error

echo "🔍 Checking R package dependencies..."
echo ""

# Check for missing packages and install if needed
if ! Rscript scripts/check-r-packages.R --install; then
    echo ""
    echo "❌ Failed to install required R packages"
    echo "Please install missing packages manually or fix installation errors"
    exit 1
fi

echo ""
echo "✓ All dependencies satisfied"
echo ""
echo "🚀 Starting Quarto render..."
echo ""

# Run quarto render with any passed arguments
quarto render "$@"

echo ""
echo "✓ Render complete"
