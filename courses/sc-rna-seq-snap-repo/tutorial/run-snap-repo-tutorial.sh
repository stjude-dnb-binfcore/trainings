#!/bin/bash

# Exit on any error and pipefail to catch errors in piped commands
set -e
set -o pipefail

# Set up modules
module load R/4.4.0
module load pandoc/3.2
#module load texlive/20240326 #to load LaTeX on a compute node

# Read paths
rootdir=$(realpath "./../../..")
echo "$rootdir"

moduledir="$rootdir/courses/sc-rna-seq-snap-repo/tutorial"
echo "$moduledir"

# Create the output directory if it doesn't exist
mkdir -p "$moduledir/snap-tutorial-docs"

resultsdir="$moduledir/snap-tutorial-docs"
echo "$resultsdir"

################################################################################################################
# Run Rscript to render the RMarkdown file to HTML
Rscript -e "rmarkdown::render('01-snap-repo-tutorial.Rmd', 
            output_file = paste0('$resultsdir', '/Snap-tutorial-', Sys.Date(), '.html'), 
            params = list(root_dir = '$rootdir'))"
################################################################################################################
