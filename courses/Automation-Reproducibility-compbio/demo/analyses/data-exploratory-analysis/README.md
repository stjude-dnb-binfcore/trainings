# Pipeline for Data exploratory analysis

## Usage

To run the script in this module from the command line sequentially, use:

```
bash run-data-exploratory-analysis.sh
```

`run-data-exploratory-analysis.sh` is designed to be run as if it was called from this module directory even when called from outside of this directory.

Parameters according to the project and analysis strategy will need to be specified in the following scripts:
- `project_parameters.Config.yaml` located at the `root_dir`: define params as necessary.
- `run-sample-distribution-analysis.R`: define `root_dir`.


The module runs for the following tools: `R`, `pandoc` and `texlive`. Versions are defined in the `run-data-exploratory-analysis.sh`, and relative modules exist and run automatically from St Jude HPC. In addition, the `tidyverse` R package is required to run the `01-data-exploratory-analysis.Rmd`.


## Folder content

This folder contains a script tasked to analyze the distribution of samples across the project.


### Methods

This is an exploratory analysis of the data in the project. We are investigating the number of samples per `Sex`. This is a demo designed for the purposes of the `Best practices` training in the context of the `Automation and Reproducibility in Computational Biology` course. 


## Folder structure 

The structure of this folder is as follows:

```
├── 01-data-exploratory-analysis.Rmd
├── gitignore.txt
├── plots
|   ├── figures
|   |   └── samples-per-sex.pdf
|   ├── Report-data-exploratory-analysis-<Sys.Date()>.html
|   └── Report-data-exploratory-analysis-<Sys.Date()>.pdf
├── README.md
├── Report-data-exploratory-analysis-<Sys.Date()>.log
├── run-data-exploratory-analysis.R
├── run-data-exploratory-analysis.sh
└── util
|___└── function-create-barplot.R
```