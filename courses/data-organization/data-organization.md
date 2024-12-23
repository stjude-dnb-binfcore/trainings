# Data organization and file format

The `Intro to sc/snRNA-seq and Advanced visualization with R Shiny` provides an introduction to QC of raw sc/snRNA-seq data, QC of sc/snRNA-seq alignment data, and cell-leveling filtering of sc/snRNA-seq data. Additionally, this course demonstrates how R Shiny applications can be utilized to explore sc/snRNA-seq data and produce figures for sc/snRNA-seq analysis.
 
 
For the visualization portion of the workshop, we utilize the [Honnell et al., 2022](https://doi.org/10.1038/s41467-021-27924-y) cohort displayed in the [R Shiny app](https://vsx2-deletion.stjude.org/).

## Technical tips and tricks about data organization

• Leave the raw data raw - do not change it!
• Put each observation or sample in its own row in datasets/cohorts.
• Put all your variables in columns - the thing that vary between samples, like ‘strain’ or ‘DNA-concentration’.
• Have column names be explanatory, but without spaces. Use ‘-’, ‘_’ or camel case instead of a space. For instance ‘library-prepmethod’
or ‘LibraryPrep’is better than ’library preparation method’ or ‘prep’, because computers interpret spaces in particular ways.
• Do not combine multiple pieces of information in one cell. Sometimes it just seems like one thing, but think if that’s the only way
you’ll want to be able to use or sort that data. For example, instead of having a column with species and strain name (e.g. E. coli
K12) you would have one column with the species name (E. coli) and another with the strain name (K12). Depending on the type of
analysis you want to do, you may even separate the genus and species names into distinct columns.
• Export the cleaned data to a text-based format like CSV (comma-separated values) format. This ensures that anyone can use the
data and is required by most data repositories.


## Naming of [Files]

- Some “good” file names:
    > - Res_0.1_Markers_all.tsv
    > - Report_cell_contamination_removal_2024-07-17.html
    > - 04-find-markers.Rmd

- Some “not so good” file names:
    > - script.py
    > - AVRS638GVEW4.fastq.gz
    > - tastingnotes (3).docx
    > - My final cohort FINAL3 for mouse UPDATED.docx

### Machine friendly

Avoid spaces
• Old computer systems get confused by spaces
• All computer systems are old underneath
• Use underscores or dashes to separate words instead
• Use “standard” characters:
• Letters, numbers, underscores, and dashes
• Periods only for file extensions (.txt, .tsv, .R, .tar.gz)
• Many characters have special meanings in code. Avoid them! (e.g. * + ? | $ / “ )
• Be consistent with case
• Don’t assume case has meaning: on some systems it does, and on some it doesn’t
• But always act as if it does!
• Never have two files that are the same but for case


### Human friendly

Names should contain information about file content
• Short names are tempting, but you may regret choosing them!
• 01.R
• data.txt
• tests.py
• Use long descriptive names
• 01_download-mouse-data.sh
• Res_0.1_Markers_top_10_Heatmap.png
• Which files do you want to look for before a deadline?
• Which files do you want to get from your collaborator?

### Files you didn’t create

All the guidelines and suggestions for file names are great for your files, but sometimes files come from other sources
• If you are lucky, they will follow nice conventions! 🎉
• but often they won’t 🫤
• To rename or not to rename, that is the question
• Leaving the name as it was sent can make it easier to track in correspondence
• Reasons to rename:
• uniformative generic names: data.txt
• add source or date information
• converting spaces or other special characters (but try to write code that can handle these!)
• If you choose to rename, do it with a script and document the original name and source.

## File format





## Below is the main directory structure 

```
├── data-organization.md
└── img
|__ └── DNB-BINF-Core-logo.png
```


### Supplemental materials and learning resources
* Regarding Data tidiness and data wrangling for NGS projects, please see [Project Organization and Management for Genomics](https://datacarpentry.org/organization-genomics/)
Source (edited) by Data Lab Reproducibility Workshop

## Course Authors

Antonia Chroni, PhD ([@AntoniaChroni](https://github.com/AntoniaChroni))

## Contact

Contributions, issues, and feature requests are welcome! Please feel free to check [issues](https://github.com/stjude-dnb-binfcore/trainings/issues).

---

*These materials have been developed by the Bioinformatic core team at the [St. Jude Children's Research Hospital](https://www.stjude.org/). These are open access materials distributed under the terms of the [BSD 2-Clause License](https://opensource.org/license/bsd-2-clause), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*