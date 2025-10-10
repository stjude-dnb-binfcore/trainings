
<p align="center">
  <img src="img/DNB-BINF-Core-logo.png" alt="DNB Logo" width="180">
</p>

<h1 align="center">DNB Training</h1>
<hr>
<h2 align="center">scRNA-seq Snap Pipeline – Quick Start Guide</h2>

----

This is a step-by-step quick reference for setting up, configuring, and running the `sc-rna-seq-snap` pipeline on an HPC environment. This guide covers essential commands, file organization, and job submission, tailored for use with `RStudio/R v4.4.0` and `Seurat v4.4.0`.

Please execute the steps **in the specified order** to ensure a successful Snap pipeline run.

For best practices and detailed guidelines on effectively using the Snap pipeline, please review the [Tutorial and documentation for the snap pipeline](https://github.com/stjude-dnb-binfcore/trainings/tree/main/courses/sc-rna-seq-snap-repo/tutorial/snap-tutorial-docs).


---

## **Workflow Overview**

🖥️ **1. HPC Login & Basic Setup** – connect to the cluster and create your project folder  
🍴 **2. Fork & Clone Repository** – copy the training repo to your GitHub and HPC  
🧩 **3. Setup Singularity Container** – prepare your analysis environment  
🧾 **4. Prepare Metadata File** – organize input sample information  
⚙️ **5. Configure YAML File** – edit file paths and project details  
🚀 **6. Run Modules** – execute the training analysis step by step


---


## Table of Contents

1. [HPC Login and Basic Setup](#hpc-login-and-basic-setup)
   - [Login](#login)
   - [Start an interactive session](#start-an-interactive-session)
   - [Check your location](#check-your-location)

2. [Fork and Clone Snap Repository](#fork-and-clone-snap-repository)
   - [Create a fork](#create-a-fork)
   - [Clone](#clone)

3. [Setup Singularity Container](#setup-singularity-container)
   - [Load the singularity module](#load-the-singularity-module)
   - [Pull the singularity container](#pull-the-singularity-container)

4. [Prepare Metadata File](#prepare-metadata-file)
   - [Training data](#training-data)
   - [Create a metadata file](#create-a-metadata-file)

5. [Config File Preparation](#config-file-preparation)
   - [Required paths](#required-paths)
   - [Other fields to edit](#other-fields-to-edit)
   - [General edits](#general-edits)

6. [Run Modules](#run-modules)
   - [Navigate to the analyses folder](#navigate-to-the-analyses-folder)
   - [`fastqc-analysis` module](#fastqc-analysis-module)
   - [`cellranger-analysis` module](#cellranger-analysis-module)
   - [`upstream-analysis` module](#upstream-analysis-module)
   - [`integrative-analysis` module](#integrative-analysis-module)
   - [`cluster-cell-calling` module](#cluster-cell-calling-analysis-module)
   - [`cell-types-annotation` module](#cell-types-annotation-module)
   - [`rshiny-app` module](#rshiny-app-module)
   - [`project-updates` module](#project-updates-module)
   - [Other available modules](#other-available-modules)
   
   
---


## HPC login and Basic Setup

### 1. Login

Login to St Jude's HPC environment using your login credentials.

```
ssh username@hpc.stjude.org
```
*Enter your password when prompted.*

### 2. Start an interactive session

Open an interactive node on the HPC and adjust memory/resources as needed.

```
bsub -P hpcf_interactive -J hpcf_interactive -n 2 -q standard -R "rusage[mem=16G]" -Is "bash"
```


### 3. Check your location

As soon as you enter the HPC environment, your current location will be: `/home/username/`.

To confirm, run below commmand:

```
pwd
```

---

## Fork and Clone Snap Repository

### 1. Create a fork

Click the below link to open the repo:

https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap

Then, click **Fork** on the top right section of the GitHub page

On the next page:

1. **Choose an owner**: stjude-dnb-binfcore
2. **Repository name**: sc-rna-seq-snap-dnb-training-**YOUR-FIRST-NAME**
3. **Description**: dnb-training-2025-10-29

Click **Create Fork** to finalize.


### 2. Clone

To copy the repository from GitHub to HPC environment, go to your GitHub fork page and click **Code** button (in green) and copy the url. Then, paste the url in HPC terminal as below:

```
git clone https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap.git
```

Check the contents of the repository:

```
cd sc-rna-seq-snap-dnb-training-**YOUR-FIRST-NAME**

ls
```

---

## Setup Singularity Container

### 1. Load the singularity module

Please note that a version of Singularity is installed by default on all the cluster nodes at St Jude HPC. Otherwise the user needs to ensure and load Singularity module by running the following on HPC:

```
module load singularity/4.1.1
```

### 2. Pull the singularity container

Pull the singularity container from the `sc-rna-seq-snap` root_dir

```
singularity pull docker://achronistjude/rstudio_4.4.0_seurat_4.4.0:latest
```

---

## Prepare Metadata File

The metadata file is an essential input for running the pipeline. It specifies which samples to process, assigns their names, and provides the locations of their corresponding FASTQ files.

### 1. Training data

This hands-on workshop uses a training dataset (FASTQ files) stored on internal DNB research storage; see the `project_parameters.Config.yaml` file for exact location.

*DNB members should have access to this location.*

**Note: For now, use the provided project_config.yaml file. Replace the existing YAML file in your cloned repository with this one before running the pipeline.**

### 2. Create a metadata file

Make a tab-separated (TSV) file named `project_metadata.tsv` and save it in `analyses/data/project_metadata/` with in your project folder, `sc-rna-seq-snap-dnb-training-**YOUR-FIRST-NAME**/`

It can include one or more samples, as long as it contains at least the following columns in this exact order: ID, SAMPLE, and FASTQ. 
- The `ID ` column must contain unique values. 
- The `SAMPLE` column must contain the seq_submission_code along with the ID, e.g., seq_submission_code1_sample1 or the corresponding library name. 
- The `FASTQ` column must contain the file path to the fastq files.


| ID | SAMPLE | FASTQ | 
:----------|:----------|:----------|
| DYE001 | seq_submission_code1_sample1 | /absolute_path/seq_submission_code1/replicate1,/absolute_path/seq_submission_code1/replicate2 | 

*Easiest way: Edit the provided template in `project_metdatda/`*

Add additional metadata columns after these three columns.

**Note: For now, use the provided `project_metadata.tsv` file. Replace the existing `.tsv` file in your cloned repository with this one before running the pipeline.**

---

## Config File Preparation

This pipeline is designed so that you only need to edit **one file** to run the analysis: `project_parameters.Config.yaml`. Open the `.yaml` file in RStudio or Visual Studio Code to edit. Fill in the fields below with your HPC paths and project info. That’s it!

**Note: For now, use the provided `project_parameters.Config.yaml` file and make necessary changes. Replace the existing `.yaml` file in your cloned repository with this one before running the pipeline.**

*`project_parameters.Config.yaml` file should be placed in `sc-rna-seq-snap-dnb-training-**YOUR-FIRST-NAME**/`.

### 1. Required paths

*Replace <your-username> with your actual HPC username*

```
# Project folder location - line 2
root_dir: /home/<username>/projects/sc-rna-seq-snap-dnb-training**YOUR-FIRST-NAME**

# Cellranger Results location - line 3
data_dir: /home/<username>/sc-rna-seq-snap-dnb-training**YOUR-FIRST-NAME**/analyses/cellranger-analysis/results/02_cellranger_count/DefaultParameters    

# `project_metadata.tsv` file location - line 4 :  Use the provided metadata file path in yaml file for now
metadata_dir:

# Reference genome location - line 25 : Use the provided reference path in yaml filefor now
genome_reference_path: 

# Cell type marker file location - line 121 : Use the provided file path in yaml file for now
gene_markers_dir_annotation_module: 

```

### 2. Other fields to edit

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

### 3. General edits

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
to confirm the module ran successfully and contact the <strong>DNB Single Cell Bioinformatics Core,</strong> if issues occur.
</div>


### 1. Navigate to the `analyses/` folder

Before running any module, make sure you are inside your working directory. In this case, it is `/home/username/sc-rna-seq-snap-dnb-training**YOUR-FIRST-NAME**/`. Run the following commands to do this:

```
cd /home/username/sc-rna-seq-snap-dnb-training**YOUR-FIRST-NAME**/
pwd

cd analyses/
ls
```

You should see subfolders like `fastqc-analysis`, `cellranger-analysis` and so on.


### 2. `fastqc-analysis` module

**a. Submit as an LSF job:**
To run `fastqc-analysis` module, enter in to the module folder and run lsf script: `lsf-script.txt`. This script tells the HPC to queue and run the job automatically in the background, freeing your terminal so you can continue working while the analysis runs.

```
cd fastqc-analysis/ # enter the module folder
bsub < lsf-script.txt
```

**b. Running from the terminal (interactive node inside the container)**:

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


### 3. `cellranger-analysis` module

To run this module, navigate to the module folder and run below:

```
cd cellranger-analysis/ # enter the module folder
bsub < submit-multiple-jobs
```


### 4. `upstream-analysis` module

To run this module, navigate to the module folder and run below:

```
cd upstream-analysis/ # enter the module folder
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


### 8. `rshiny-app` module

To run this module, navigate to the module folder and run below:

```
cd rshiny-app/ # enter the module folder
bsub < lsf-script.txt
```

### 9. `project-updates` module

To run this module, navigate to the module folder and run below:

```
cd project-updates/ # enter the module folder
bsub < lsf-script.txt
```

### 10. Other available modules

- `cell-contamination-removal-analysis` module (description="To remove clusters and repeat steps (4) and (5), e.g. for PDX experiments.", required=False)
- `clone-phylogeny-analysis` module (description="Pipeline for Clone phylogeny analysis tool. This is currently available for human data only", required=False)


---


## Contact

Contributions, issues, and feature requests are welcome! Please feel free to check [issues](https://github.com/stjude-dnb-binfcore/sc-rna-seq-snap/issues).




*These materials have been developed by the Bioinformatic core team at the [DNB Bioinformatics core team](https://www.stjude.org/research/departments/developmental-neurobiology/shared-resources/bioinformatic-core.html) at the [St. Jude Children's Research Hospital](https://www.stjude.org/). These are open access materials distributed under the terms of the [BSD 2-Clause License](https://opensource.org/license/bsd-2-clause), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*
