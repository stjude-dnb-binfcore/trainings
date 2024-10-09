# ##############################################################################
# How to run Docker from a Registry and from HPC ###############################
# ##############################################################################

# Pull to HPC From Harbor Registry

Pull Image From Registry → Convert to Singularity Image → Run via Singularity on HPC

## Log onto the fakeroot node via terminal and start an interactive session on a compute node

Open up an interactive session on a build node. Make sure you include enough memory to build your container.
```{}
hpcf_interactive -q hprc_test -R "rusage[mem=8GB]"
```


## Load specific version of Singularity

```{}
module load singularity/4.1.1
```

# ###################################
## Login to Harbor Registry
# SKIP IF I USE DOKERHUB REGISTRY
Use the following command: `singularity registry login --username <username> docker://svlprhpcreg01.stjude.org`

Example
```{}
singularity registry login --username achroni docker://svlprhpcreg01.stjude.org 
```
# ###################################



## Run from docker image (converts to SIF and stores in ~/.singularity)

Use the following command: `singularity run docker://svlprhpcreg01.stjude.org/hpcf/<container>:<tag>`

Example
```{}
singularity run docker://svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest
```

## Build sif file
There are two ways of doing this, build a local sif file or one that you can psuh in the registry and share with collabortaors. Let's explore both options:

# ###################################
# SKIP
### Build local sif file
Build local sif file from docker image and run from local file: `singularity build <container_tag>.sif docker://svlprhpcreg01.stjude.org/hpcf/<container>:<tag>` and `singularity run <container_tag>.sif`

Example
```{}
singularity build single-cell-rna-analysis:latest.sif docker://svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest
```
# ###################################


Containers are typically used to run noninteractive (batch) executables on generic resources like the cloud. (i.e. submit and wait for result)
`singularity run` executes a default command defined in the container image.

```{}
singularity run single-cell-rna-analysis:latest.sif
singularity exec -B $PWD:/research/dept/dnb/core_operations/Bioinformatics/achroni/GitHub/single-cell-rna-analysis docker://svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest bash


cd /research/dept/dnb/core_operations/Bioinformatics/achroni/GitHub/single-cell-rna-analysis
run my script
```









### Build Singularity Image on HPC fakeroot node→ Share via SIF File or OCI Registry 
Using the following commands: `singularity build –fakeroot <container_name_tag>.sif <container_name>.def` and `singularity push oras://<url to registry>/<container_name_tag>.sif`

```{}
singularity build –fakeroot single-cell-rna-analysis:latest.sif single-cell-rna-analysis.def
singularity push oras://<url to docker://svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest.sif
```











### Singularity OCI Registry 

Open Container Initiative (OCI) Format
Singularity has partially adopted the Docker based OCI format over their original SIF format to improve conversion compatibility. This --oci mode is the default for the latest versions of Singularity

Build a Singularity Image Format (SIF) file and Run 
```{}
singularity build --fakeroot lolcow.sif lolcow.def
singularity run lolcow.sif
```

Share your SIF Image via the Registry
```{}
singularity registry login -u <username> oras://svlprhpcreg01.stjude.org
singularity push lolcow.sif oras://svlprhpcreg01.stjude.org/hpcf/lolcow:ceb
singularity run oras://svlprhpcreg01.stjude.org/hpcf/lolcow:ceb
```

Notes on [SIF-OCI compatibility](https://docs.sylabs.io/guides/latest/user-guide/oci_runtime.html).













# Instructions for setting up your fakeroot permissions for HPC

To install with certain package managers, the builder must have root permissions within the image. To grant this temporary permission, fakeroot implements a fake root environment for the purpose of building Singularity containers. A user namespace UID/GID mapping allows a user to be root (uid 0) in a container to install packages, but have no privilege on the host.

⚠️ First, please request fakeroot id map for <username> on [ServiceNow Portal](https://stjude.service-now.com/), Direct this request to HPCF. You can learn more [here](https://wiki.stjude.org/display/RC/Building+Singularity+containers+with+fakeroot).



# Pull to HPC From Harbor Registry

Pull Image From Registry → Convert to Singularity Image → Run via Singularity on HPC

## Log onto the fakeroot node via terminal and start an interactive session on a compute node

Open up an interactive session on a build node. Make sure you include enough memory to build your container.
```{}
hpcf_interactive -q hprc_test -R "rusage[mem=8GB]"
```

Open up an interactive session on a fakeroot enabled node (-q fakeroot). Make sure you include enough memory to build your container.
```{}
hpcf_interactive -q fakeroot --mempercore 8GB
```


## Load specific version of Singularity

```{}
module load singularity/4.1.1
```

## Login to Harbor Registry
Use the following command: `singularity registry login --username <username> docker://svlprhpcreg01.stjude.org`

Example
```{}
singularity registry login --username achroni docker://svlprhpcreg01.stjude.org 
```

## Run from docker image (converts to SIF and stores in ~/.singularity)

Use the following command: `singularity run docker://svlprhpcreg01.stjude.org/hpcf/<container>:<tag>`

Example
```{}
singularity run docker://svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest
```

## Build sif file
There are two ways of doing this, build a local sif file or one that you can psuh in the registry and share with collabortaors. Let's explore both options:

### Build local sif file
Build local sif file from docker image and run from local file: `singularity build <container_tag>.sif docker://svlprhpcreg01.stjude.org/hpcf/<container>:<tag>` and `singularity run <container_tag>.sif`

Example
```{}
singularity build single-cell-rna-analysis:latest.sif docker://svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest
```

Containers are typically used to run noninteractive (batch) executables on generic resources like the cloud. (i.e. submit and wait for result)
`singularity run` executes a default command defined in the container image.

```{}
singularity run single-cell-rna-analysis:latest.sif
```


### Build Singularity Image on HPC fakeroot node→ Share via SIF File or OCI Registry 
Using the following commands: `singularity build –fakeroot <container_name_tag>.sif <container_name>.def` and `singularity push oras://<url to registry>/<container_name_tag>.sif`

```{}
singularity build –fakeroot single-cell-rna-analysis:latest.sif single-cell-rna-analysis.def
singularity push oras://<url to docker://svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest.sif
```











### Singularity OCI Registry 

Open Container Initiative (OCI) Format
Singularity has partially adopted the Docker based OCI format over their original SIF format to improve conversion compatibility. This --oci mode is the default for the latest versions of Singularity

Build a Singularity Image Format (SIF) file and Run 
```{}
singularity build --fakeroot lolcow.sif lolcow.def
singularity run lolcow.sif
```

Share your SIF Image via the Registry
```{}
singularity registry login -u <username> oras://svlprhpcreg01.stjude.org
singularity push lolcow.sif oras://svlprhpcreg01.stjude.org/hpcf/lolcow:ceb
singularity run oras://svlprhpcreg01.stjude.org/hpcf/lolcow:ceb
```

Notes on [SIF-OCI compatibility](https://docs.sylabs.io/guides/latest/user-guide/oci_runtime.html).




