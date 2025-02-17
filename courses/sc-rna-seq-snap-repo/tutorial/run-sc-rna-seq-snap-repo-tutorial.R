#################################################################################
# This will run all scripts in the module
#################################################################################
# Load library
suppressPackageStartupMessages({
  library(rmarkdown)
})

#################################################################################
# Set up directories and paths to root_dir
root_dir <- getwd()

# Create results_dir
results_dir <- file.path(root_dir, "snap-tutorial-docs")
if (!dir.exists(results_dir)) {
  dir.create(results_dir)}

# Define dynamic output file name using Sys.Date()
output_file <- paste0(results_dir, "/", "Snap-tutorial-", Sys.Date(), ".html")

# Render the R Markdown file
render("sc-rna-seq-snap-repo-tutorial.Rmd", output_file = output_file,
       params = list(root_dir = root_dir))