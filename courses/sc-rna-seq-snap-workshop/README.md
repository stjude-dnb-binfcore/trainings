<p align="center">
  <img src="img/DNB-BINF-Core-logo.png" alt="DNB-BINF-Core-logo" width="560px" />
</p>
<p align="center">
  <a href="https://www.repostatus.org/#active"><img src="https://www.repostatus.org/badges/latest/active.svg?style=for-the-badge" alt="The project has reached a stable, usable state and is being actively developed." /></a>

</p>


# scRNA-seq Snap seq pipeline: Hands-on workshop

A brief overview of single cell RNA-seq is followed by a guided, hands-on run of the [Single cell RNA Seq Snap workflow (ScRNASeqSnap)](https://github.com/stjude-dnb-binfcore/trainings/tree/main/courses/sc-rna-seq-snap-repo/). Using a small training dataset, the workflow is executed end-to-end: QC, alignment & quantification, integration, clustering, cell-type annotation, and reporting via RShiny—all within a reproducible, containerized HPC environment. Upon completion, participants receive a project folder containing standard figures, reports, an RShiny app, and comprehensive Snap pipeline documentation for further exploration.

This workshop is an initiative of our team at the [Bioinformatics Core at the Department of Developmental Neurobiology at the St. Jude Children's Research Hospital](https://www.stjude.org/research/departments/developmental-neurobiology/shared-resources/bioinformatic-core.html)





| Audience | Computational Skills | Prerequisites | Duration |
:----------|:----------|:----------|:----------|
| Biologists/Bioinformaticians | Beginner | None | 1 h|


## Learning Objectives

1. Prepare the required inputs: a properly formatted `project_metadata.tsv` and `project_parameters.Config.yaml`.
2. Launch the container on the HPC and submit or monitor your jobs.
3. Run the ScRNASeqSnap modules sequentially.
4. Review the generated results, plots, and reports.


## Target Audience

The course is intended for wet lab biologists or bioinformaticians that are interested in exploring the capabilities of the `ScRNASeqSnap` pipeline. 


> These materials were developed for a trainer-led workshop, but are also amenable to self-guided learning.

## Lessons and Materials 

* `./resources`: supplemental materials and learning resources 
* `./lectures`: [sc-rna-seq-snap-workshop-2025-10-29](https://github.com/stjude-dnb-binfcore/trainings/tree/main/courses/sc-rna-seq-snap-workshop/lectures). _Currently under construction—stay tuned for updates!_ 🚧
* St. Jude employees can access a recording from the workshop [here](https://teams.microsoft.com/l/meetingrecap?driveId=b%21fN4oOhnmUUuqlHPV1c7pwEz1ilgyhJ1Lk_sJgdXcVo34BRz2JdXfS7NNnTxRnyuG&driveItemId=01AWJWDAVLIDUF4GK3HVDL2VBM566ZN5Y3&sitePath=https%3A%2F%2Fsjcrh-my.sharepoint.com%2F%3Av%3A%2Fg%2Fpersonal%2Fajannu_stjude_org%2FEatA6F4ZWz1GvVQs772W9xsBpDD2hQLHXfca3zLw8vNHNw&fileUrl=https%3A%2F%2Fsjcrh-my.sharepoint.com%2Fpersonal%2Fajannu_stjude_org%2FDocuments%2FRecordings%2FSNAP%2520Hands%2520On-20251029_133448-Meeting%2520Recording.mp4%3Fweb%3D1&iCalUid=040000008200E00074C5B7101A82E008000000002516D392FE48DC01000000000000000010000000AB6F052E372ECF48B08125DB93C82D15&threadId=19%3Ameeting_NTAxOTA4YzctNDJhMC00ODAzLWEyYWItNzBiOGQzYjI3NDk3%40thread.v2&organizerId=14012ba9-3073-423e-94c5-c98d88650bba&tenantId=22340fa8-9226-4871-b677-d3b3e377af72&callId=e98bce8a-a706-4c83-8864-cc6d22c85647&threadType=Meeting&meetingType=Scheduled&subType=RecapSharingLink_RecapCore)

 
## Below is the main directory structure listing the analyses and data files used in this repository

```
├── img
|   └── DNB-BINF-Core-logo.png
├── lectures
├── README.md
└── resources
|   ├── snap_quickstart_guide.html
|   ├── snap_quickstart_guide.md
|__ └── links-to-resources.md
```


## Course Authors

Asha Jacob Jannu, MS ([@ashajacob29](https://github.com/ashajacob29))

## Contact

Contributions, issues, and feature requests are welcome! Please feel free to check [issues](https://github.com/stjude-dnb-binfcore/trainings/issues).

---

*These materials have been developed by the [DNB Bioinformatics core team](https://www.stjude.org/research/departments/developmental-neurobiology/shared-resources/bioinformatic-core.html) at the [St. Jude Children's Research Hospital](https://www.stjude.org/). These are open access materials distributed under the terms of the [BSD 2-Clause License](https://opensource.org/license/bsd-2-clause), which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.*
