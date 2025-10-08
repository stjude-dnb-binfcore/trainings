
<p align="center">
  <img src="DNB-BINF-Core-logo.png" alt="DNB Logo" width="180">
</p>

<h1 align="center">DNB Training</h1>
<hr>
<h2 align="center">scRNA-seq Snap-seq pipeline - CHEAT SHEET</h2>

----

> A concise, step-by-step guide for setting up, configuring, and running the `sc-rna-seq-snap` pipeline on the HPC environment. Use this as your quick reference for essential commands, file setup, and job submission. These are customized for `Rstudio/R v4.4.0` and `Seurat v4.4.0`.
>
> Please execute them **in the given order** to ensure a successful `sc-rna-seq-snap` pipeline run.

**Tutorial:** <https://github.com/stjude-dnb-binfcore/trainings/tree/main/courses/sc-rna-seq-snap-repo/tutorial/snap-tutorial-docs>

---

## What you’ll do (high-level)
1) **HPC Login and Basic Setup** → 2) **Fork and Clone `sc-rna-seq-snap` Repository** → 3) **Setup Singularity Container** → 4) **Prepare Metadata File** → 5) **Config file preparation** → 6) **Run modules**

---

> **Workflow Overview**
>
> 🖥️ **1. HPC Login & Basic Setup** – connect to the cluster and create your project folder  
> 🍴 **2. Fork & Clone Repository** – copy the training repo to your GitHub and HPC  
> 🧩 **3. Setup Singularity Container** – prepare your analysis environment  
> 🧾 **4. Prepare Metadata File** – organize input sample information  
> ⚙️ **5. Configure YAML File** – edit file paths and project details  
> 🚀 **6. Run Modules** – execute the training analysis step by step


---


## Table of Contents

1. [HPC Login and Basic Setup](#hpc-login-and-basic-setup)
   - [1. Login](#1-login)
   - [2. Start an Interactive Session](#2-start-an-interactive-session)
   - [3. Check your location](#3-check-your-location)

2. [Fork and Clone `sc-rna-seq-snap` Repository](#fork-and-clone-sc-rna-seq-snap-repository)
   - [1. Create a Fork](#1-create-a-fork)
   - [2. Clone](#2-clone)

3. [Setup Singularity Container](#setup-singularity-container)
   - [1. Load the Singularity Module](#1-load-the-singularity-module)
   - [2. Pull the Singularity Container](#2-pull-the-singularity-container)

4. [Prepare Metadata File](#prepare-metadata-file)
   - [1. Create a Metadata File](#1-create-a-metadata-file)
   - [2. Add Additional Columns](#2-add-additional-columns)

5. [Config File Preparation](#config-file-preparation)
   - [1. Required Paths](#1-required-paths)
   - [2. Other Fields to Edit](#2-other-fields-to-edit)
   - [3. General Edits](#3-general-edits)

6. [Run Modules](#run-modules)
   - [1. Navigate to the Analyses Folder](#1-navigate-to-the-analyses-folder)
   - [2. `fastqc-analysis` module](#2-fastqc-analysis-module)
   - [3. `cellranger-analysis` module](#3-cellranger-analysis-module)
   - [4. `upstream-analysis` module](#4-upstream-analysis-module)
   - [5. `integrative-analysis` module](#5-integrative-analysis)
   - [6. `cluster-cell-calling` module](#6-cluster-cell-calling-analysis)
   - [7. `cell-types-annotation` module](#7-cell-types-annotation)
   - [8. `rshiny-app` module](#8-rshiny-app)

---


## HPC login and Basic Setup

### 1. Login

Login to St Jude's HPC environment using your login credentials.

```
ssh username@hpc.stjude.org
```
*Enter your password when prompted.*

### 2. Start an Interactive Session

Open an interactive node on the HPC and adjust memory/resources as needed.

```
bsub -P hpcf_interactive -J hpcf_interactive -n 2 -q standard -R "rusage[mem=16G]" -Is "bash"
```


### 3. Check your location

As soon as you enter the HPC environment, your current location will be: `/home/username/`.
To confirm, run below commmand:

```
# prints your current folder path
pwd
```

---

## Fork and Clone `sc-rna-seq-snap` Repository

### 1. Create a Fork

Click the below link to open the repo:

https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap-dnb-training

Then, click **Fork** on the top right section of the GitHub page

On the next page:

1. **Choose an owner**: stjude-dnb-binfcore
2. **Repository name**: sc-rna-seq-snap-dnb-training *(as is)*
3. **Description**: *(as is)*

Click **Create For** to finalize.


### 2. Clone

To copy the repository from GitHub to HPC environment, go to your GitHub fork page and click **Code** button (in green) and copy the url. Then, paste the url in HPC terminal as below:

```
git clone https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap-dnb-training.git
```

Check the contents of the repository:

```
# enter the directory/folder
cd sc-rna-seq-snap-dnb-training

# list the files and directories/folders
ls
```

---

## Setup Singularity Container

### 1. Load the Singularity Module

Please note that a version of Singularity is installed by default on all the cluster nodes at St Jude HPC. Otherwise the user needs to ensure and load Singularity module by running the following on HPC:

```
module load singularity/4.1.1
```

### 2. Pull the Singularity Container

1. Pull the singularity container from the `sc-rna-seq-snap` root_dir

```
singularity pull docker://achronistjude/rstudio_4.4.0_seurat_4.4.0:latest
```

---

## Prepare Metadata File

The metadata file is an essential input for running the pipeline. It tells the workflow which samples to process, their names, and where to find their FASTQ files.

### 1. Locate Training Data

The training dataset for this hands-on work shop is located here:

```
cd /research/dept/dnb/core_operations/Bioinformatics/common/scRNA-seq-snap-pipeline-workshop/fastqs
```

*DNB members should have access to this location*

**Note: For now, use the provided project_config.yaml file. Replace the existing YAML file in your cloned repository with this one before running the pipeline.**

### 2. Create a metadata file

Make a tab-separated (TSV) file named `project_metadata.tsv` and save it in `analyses/data/project_metadata/` with in your project folder, `sc-rna-seq-snap-dnb-training/`

The first THREE columns (in this exact order) should be:

-	Column 1: Sample ID
-	Column 2: Sample name
-	Column 3: Path/to/fastq/files

| ID | SAMPLE | FASTQ | 
:----------|:----------|:----------|
| DYE001 | seq_submission_code1_sample1 | /absolute_path/seq_submission_code1/replicate1,/absolute_path/seq_submission_code1/replicate2 | 

*Easiest way: Edit the provided template in `project_metdatda/`*

Add additional metadata columns after these three columns. For more information on metadata file, please refer `fastqc-analysis/README.md`

**Note: For now, use the provided `project_metadata.tsv` file. Replace the existing `.tsv` file in your cloned repository with this one before running the pipeline.**

---

## Config file preparation

This pipeline is designed so that you only need to edit **one file** to run the analysis: `project_parameters.Config.yaml`. Open the `.yaml` file in RStudio or Visual Studio Code to edit. Fill in the fields below with your HPC paths and project info. That’s it!

**Note: For now, use the provided `project_parameters.Config.yaml` file and make necessary changes. Replace the existing `.yaml` file in your cloned repository with this one before running the pipeline.**

*`project_parameters.Config.yaml` file should be placed in `sc-rna-seq-snap-dnb-training/`.

### 1. Required paths

*Replace <your-username> with your actual HPC username*

```
# Project folder location - line 2
root_dir: /home/<username>/projects/sc-rna-seq-snap-dnb-training

# Cellranger Results location - line 3
data_dir: /home/<username>/sc-rna-seq-snap-dnb-training/analyses/cellranger-analysis/results/02_cellranger_count/DefaultParameters    

# `project_metadata.tsv` file location - line 4 :  Use the provided metadata file path in yaml file for now
metadata_dir:

# Reference genome location - line 25 : Use the provided reference path in yaml filefor now
genome_reference_path: 

# Cell type marker file location - line 121 : Use the provided file path in yaml file for now
gene_markers_dir_annotation_module: 

```

### 2. Other Fields to Edit

```
# line - 6
genome_name:

# line - 27
genome_name_cellranger:

# line - 32
sample_prefix: 
  - WT
  - KO
  - DYE #(Dyer lab)

```

### 3. General Edits

```
# line 7
PROJECT_NAME: "scRNA seq Snap Pipeline - Hand on"

# line 10
PROJECT_LEAD_NAME:

# line 8
PI_NAME:

# line 12
LEAD_ANALYSTS:

# line 13
GROUP_LEAD:

# line 14
CONTACT_EMAIL:
```

Save the `project_parameters.Config.yaml` file and close it.

---

## Run Modules

Once your `project_parameters.Config.yaml` and `project_metadata.tsv` files are ready, you can begin running modules step by step. Each module performs a major step of the single-cell RNA-seq analysis.

<div style="background-color:#f8f9fa;border:2px solid #e1e4e8;
padding:8px 12px;margin:10px 0;font-size:85%;border-radius:6px;">
<strong>Note:</strong> After each run, check <code>job.out</code> and <code>job.err</code> 
to confirm the module ran successfully and contact the <strong>DNB Single Cell Bioinformatics Core</strong> if issues occur.
</div>


### 1. Navigate to the `analyses/` folder

Before running any module, make sure you are inside your working directory. In this case, it is `/home/username/sc-rna-seq-snap-dnb-training`. Run the following commands to do this:

```
cd /home/username/sc-rna-seq-snap-dnb-training
pwd           # shows your current path
ls            # lists files and folders in the directory

cd analyses/  # takes you to analyses/ folder
pwd
```

You should see subfolders like `fastqc-analysis`, `cellranger-analysis` and so on.


### 2. `fastqc-analysis` module

**a. Submit as an LSF job:**
To run `fastqc-analysis` module, enter in to the module folder and run lsf script: `lsf-script.txt`. This script tells the HPC to queue and run the job automatically in the background, freeing your terminal so you can continue working while the analysis runs.

```
cd fastqc-analysis/ # enter the module folder
bsub < lsf-script.txt
```

**b. Running from the Terminal (interactive node inside the container)**:

i) Start the analysis container:

```
bash run-terminal.sh
```

ii) Navigate to your module folder, confirm location, list files:

```
bash run-fastqc-analysis.sh
```

iii) When finished, you can use the same terminal method for other modules:

```
exit
```

---


### 3. `cellranger-analysis` module

To run this module, navigate to the module folder and run below:

```
cd cellranger-analysis/ # enter the module folder
bsub < submit-multiple-jobs
```


### 4. `upstream-analysis` module

To run this module, navigate to the module folder and run below:

```
cd integrative-analysis/ # enter the module folder
bsub < lsf-script.txt
```


### 5. `integrative-analysis` module

To run this module, navigate to the module folder and run below:

```
cd integrative-analysis/ # enter the module folder
bsub < lsf-script.txt
```


### 6. `cluster-cell-calling` module

To run this module, navigate to the module folder and run below:

```
cd cluster-cell-calling/ # enter the module folder
bsub < lsf-script.txt
```


### 7. `cell-types-annotation` module

To run this module, navigate to the module folder and run below:

```
cd cell-types-annotation/ # enter the module folder
bsub < lsf-script.txt
```


### 9. `rshiny-app` module

To run this module, navigate to the module folder and run below:

```
cd rshiny-app/ # enter the module folder
bsub < lsf-script.txt
```


## Contact

Contributions, issues, and feature requests are welcome! Please feel free to check [issues](https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap/issues).



---


*These tools and pipelines have been developed by the Bioinformatic core team at the [St. Jude Children's Research Hospital](https://www.stjude.org/). These are open access materials distributed under the terms of the [BSD 2-Clause License](https://opensource.org/license/bsd-2-clause), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*
