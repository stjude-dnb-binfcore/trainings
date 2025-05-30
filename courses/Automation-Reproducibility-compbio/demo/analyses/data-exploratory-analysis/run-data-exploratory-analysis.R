#################################################################################
# This will run all scripts in the `sample-distribution-analysis`
#################################################################################
# Load library
suppressPackageStartupMessages({
  library(yaml)})
##################################### 
# Set up directories and paths to root_dir and analysis_dir
root_dir <- file.path("./GitHub/trainings")
demo_dir <- file.path(root_dir, "courses", "Automation-Reproducibility-compbio", "demo")
analysis_dir <- file.path(demo_dir, "analyses", "data-exploratory-analysis")
report_dir <- file.path(analysis_dir, "plots") 

#####################################
# load config file
configFile <- paste0(demo_dir, "/", "project_parameters.Config.yaml")
if (!file.exists(configFile)){
  cat("\n Error: configuration file not found:", configFile)
  stop("Exit...")
}
yaml <- read_yaml(configFile)

################################################################################################################
# Run Rmd script
################################################################################################################
rmarkdown::render('01-data-exploratory-analysis.Rmd', clean = TRUE,
                                                      output_dir = file.path(report_dir),
                                                      output_file = c(paste('Report-', 'data-exploratory-analysis-', Sys.Date(), sep = '')),
                                                      output_format = 'all',
                                                      params = list(
                                                        # the following parameters are defined in the `yaml` file
                                                        metadata_dir = yaml$metadata_dir,
                                                        PROJECT_NAME = yaml$PROJECT_NAME,
                                                        PI_NAME = yaml$PI_NAME,
                                                        TASK_ID = yaml$TASK_ID,
                                                        PROJECT_LEAD_NAME = yaml$PROJECT_LEAD_NAME,
                                                        DEPARTMENT = yaml$DEPARTMENT,
                                                        LEAD_ANALYSTS = yaml$LEAD_ANALYSTS,
                                                        GROUP_LEAD = yaml$GROUP_LEAD,
                                                        CONTACT_EMAIL = yaml$CONTACT_EMAIL,
                                                        PIPELINE = yaml$PIPELINE,
                                                        START_DATE = yaml$START_DATE,
                                                        COMPLETION_DATE = yaml$COMPLETION_DATE))

################################################################################################################
