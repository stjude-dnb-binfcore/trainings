# Data organization, file naming, and file format

The current documentation provides the systematic approach for storing, labeling, and structuring digital files to ensure easy access, management, and compatibility by our team at the [Bioinformatics Core at the Department of Neurobiology at the St. Jude Children's Research Hospital](https://www.stjude.org/research/departments/developmental-neurobiology/shared-resources/bioinformatic-core.html). Together, the practices suggested here enhance productivity, reduce errors, and support smooth collaboration and data integrity.


## Data Organization

Data Organization involves categorizing and arranging files logically (e.g., by project, date, or type) for efficient retrieval. Some technical tips and tricks about data organization:

- Leave the raw data raw - do not change it!
- Put each observation or sample in its own row in datasets/cohorts.
- Put all your variables in columns - the thing that vary between samples, like ‘strain’ or ‘DNA-concentration’.
- Have column names be explanatory, but without spaces. Use ‘-’, ‘_’ or camel case instead of a space. For instance ‘library-prepmethod’
or ‘LibraryPrep’is better than ’library preparation method’ or ‘prep’, because computers interpret spaces in particular ways.
- Do not combine multiple pieces of information in one cell. Sometimes it just seems like one thing, but think if that’s the only way
you’ll want to be able to use or sort that data. For example, instead of having a column with species and strain name (e.g. E. coli
K12) you would have one column with the species name (E. coli) and another with the strain name (K12). Depending on the type of
analysis you want to do, you may even separate the genus and species names into distinct columns.


## Naming of [Files]

File Naming follows conventions that make files easily identifiable, typically including relevant keywords, version numbers, and dates.

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

- Avoid spaces!
  - Old computer systems get confused by spaces.
  - All computer systems are old underneath.
  - Use underscores or dashes to separate words instead.

- Use “standard” characters:
  - Letters, numbers, underscores, and dashes
  - Periods only for file extensions (.txt, .tsv, .R, .tar.gz)
  - Many characters have special meanings in code. Avoid them!
    - Do not use any of these common illegal characters or symbols in your file names or folders.
       - pound, £ 
       - percent, % 
       - ampersand, & 
       - left curly bracket, {
       - right curly bracket, } 
       - back slash, \ 
       - left angle bracket, <
       - right angle bracket, >
       - asterisk, *
       - question mark, ? 
       - forward slash, / 
       - blank spaces
       - dollar sign,$ 
       - exclamation point, ! 
       - single quotes, ' 
       - double quotes, " 
       - colon, : 
       - @ at signs
       - plus sign
       - ` backtick
       - | pipe
       - = equal sign
       - emojis
       - alt codes

- Be consistent with case.
  - Don’t assume case has meaning: on some systems it does, and on some it doesn’t.
  - But always act as if it does!
    - Never have two files that are the same but for case.


### Human friendly

- Names should contain information about file content.
- Short names are tempting, but you may regret choosing them!
    > - 01.R
    > - data.txt
    > - tests.py

- Use long descriptive names
    > - 01_download-mouse-data.sh
    > - Res_0.1_Markers_top_10_Heatmap.png

- Always ask yourself:
    - Which files do you want to look for before a deadline?
    - Which files do you want to get from your collaborator?

### Files you didn’t create

- All the guidelines and suggestions for file names are great for your files, but sometimes files come from other sources.
    - If you are lucky, they will follow nice conventions! 🎉
    - but often they won’t 🫤
- To rename or not to rename, that is the question.
    - Leaving the name as it was sent can make it easier to track in correspondence
    - Reasons to rename:
       - uniformative generic names: data.txt
       - add source or date information
       - converting spaces or other special characters (but try to write code that can handle these!)
    - If you choose to rename, do it with a script and document the original name and source. Or ask us to take care of this for you!


## File Format

File Format defines the structure of a file (e.g., .csv, .txt, .jpg), ensuring it is compatible with the required software and use cases.

  - Export the cleaned data to a text-based format like CSV (comma-separated values) format. This ensures that anyone can use the
data and is required by most data repositories.


## Below is the main directory structure 

```
├── data-organization.md
└── img
|__ └── DNB-BINF-Core-logo.png
```


### Supplemental materials and learning resources
* Material by the [Automation and Reproducibility in Computational Biology course](https://github.com/stjude-dnb-binfcore/trainings/tree/add-wiki-documentation/courses/Automation-Reproducibility-compbio) and [Data Lab Reproducibility Workshop](https://alexslemonade.github.io/reproducible-research/workshop-schedule.html) (edited).

* Regarding Data tidiness and data wrangling for NGS projects, please see [Project Organization and Management for Genomics](https://datacarpentry.org/organization-genomics/)


## Authors

Antonia Chroni, PhD ([@AntoniaChroni](https://github.com/AntoniaChroni))

## Contact

Contributions, issues, and feature requests are welcome! Please feel free to check [issues](https://github.com/stjude-dnb-binfcore/trainings/issues).

---

*These materials have been developed by the Bioinformatic core team at the [St. Jude Children's Research Hospital](https://www.stjude.org/). These are open access materials distributed under the terms of the [BSD 2-Clause License](https://opensource.org/license/bsd-2-clause), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*