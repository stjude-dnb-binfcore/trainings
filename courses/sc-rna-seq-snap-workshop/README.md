<p align="center">
  <img src="img/DNB-BINF-Core-logo.png" alt="DNB-BINF-Core-logo" width="560px" />
</p>
<p align="center">
  <a href="https://www.repostatus.org/#active"><img src="https://www.repostatus.org/badges/latest/active.svg?style=for-the-badge" alt="The project has reached a stable, usable state and is being actively developed." /></a>

</p>


# scRNA-seq Snap seq pipeline: Hands-on workshop

A brief overview of single cell RNA-seq is followed by a guided, hands-on run of the [Single cell RNA Seq Snap workflow (ScRNASeqSnap)](https://github.com/stjude-dnb-binfcore/trainings/tree/main/courses/sc-rna-seq-snap-repo/). Using a small training dataset, the workflow is executed end-to-end: QC, alignment & quantification, integration, clustering, cell-type annotation, reporting/RShiny with an emphasis on reproducible execution on HPC (containerized environment). Upon completion, a working project folder containing standard figures, reports, RShiny app, and snap pipeline documentation are provided for continued exploration.

This workshop is an initiative of our team at the [Bioinformatics Core at the Department of Developmental Neurobiology at the St. Jude Children's Research Hospital](https://www.stjude.org/research/departments/developmental-neurobiology/shared-resources/bioinformatic-core.html)





| Audience | Computational Skills | Prerequisites | Duration |
:----------|:----------|:----------|:----------|
| Biologists/Bioinformaticians | Beginner | None | 1 h|


## Learning Objectives

1. Prepare the required inputs: a properly formatted project_metadata.tsv and project_parameters.Config.yaml.
2. Launch the container on HPC and submit/monitor jobs.
3. Run the `ScRNASeqSnap` modules in order
4. Reviewing Results, Plots, and Reports


## Target Audience

The course is intended for wet lab biologists or bioinformaticians that are interested in exploring the capabilities of the `ScRNASeqSnap` pipeline. 


> These materials were developed for a trainer-led workshop, but are also amenable to self-guided learning.

## Lessons and Materials 

* `./resources`: supplemental materials and learning resources 
* `./lectures`: slides covering the `scRNA-seq Snap seq pipeline: Hands-on workshop`: [Single cell RNA Seq Snap workflow (ScRNASeqSnap)](https://github.com/stjude-dnb-binfcore/trainings/tree/main/courses/sc-rna-seq-snap-repo/tutorial/snap-tutorial-docs)

 
## Below is the main directory structure listing the analyses and data files used in this repository

```
├── img
|   └── DNB-BINF-Core-logo.png
├── lectures
├── README.md
└── resources
|__ └── links-to-resources.md
```


## Course Authors

Asha Jacob Jannu, MS ([@ashajacob29](https://github.com/ashajacob29))
Antonia Chroni, PhD ([@AntoniaChroni](https://github.com/AntoniaChroni))

## Contact

Contributions, issues, and feature requests are welcome! Please feel free to check [issues](https://github.com/stjude-dnb-binfcore/trainings/issues).

---

*These materials have been developed by the [DNB Bioinformatics core team](https://www.stjude.org/research/departments/developmental-neurobiology/shared-resources/bioinformatic-core.html) at the [St. Jude Children's Research Hospital](https://www.stjude.org/). These are open access materials distributed under the terms of the [BSD 2-Clause License](https://opensource.org/license/bsd-2-clause), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*
