# ##############################################################################
# How to run Docker from a Registry and from HPC ###############################
# ##############################################################################


(1) Go to the HPC cluster and load module

```{}
hpcf_interactive -q standard
module load singularity/4.1.1
```

(2) Go to ‘my_favorite_repo` directory
(3) Pull Image From Registry → Convert to Singularity Image → Run via Singularity on HPC: `singularity run docker://<url to docker registry>/<container_name>:<tag>`

Example:
```{}
singularity run docker://godlovedc/lolcow:latest
```

(4) Obtain Singularity Image Format File → Run via Singularity on HPC

Containers are typically used to run noninteractive (batch) executables on generic resources like the cloud. (i.e. submit and wait for result)
`singularity run` executes a default command defined in the container image.

```{}
singularity run <container_name_tag>.sif
```

### HPC fakeroot

To install with certain package managers, the builder must have root permissions within the image. 

To grant this temporary permission, fakeroot implements a fake root environment for the purpose of building Singularity containers

A user namespace UID/GID mapping allows a user to be root (uid 0) in a container to install packages, but have no privilege on the host.

Request fakeroot id map for <username> on ServiceNow, Assignment Group: HPCF
   - https://stjude.service-now.com/
   - https://wiki.stjude.org/display/RC/Building+Singularity+containers+with+fakeroot


#### Log onto the fakeroot node
Open up an interactive session on a fakeroot enabled node (-q fakeroot). 

```{}
hpcf_interactive –q fakeroot  
```

Make sure you include enough memory to build your container.
```{}
hpcf_interactive -q fakeroot --mempercore 8GB
```



### Build Singularity Image on HPC fakeroot node→ Share via SIF File or OCI Registry 

```{}
singularity build –fakeroot <container_name_tag>.sif <container_name>.def
singularity push oras://<url to registry>/<container_name_tag>.sif
```

### Pull to HPC From Harbor Registry

Log into HPC cluster via terminal and start an interactive session on a compute node
```{}
hpcf_interactive –q standard –n 4
```

Load specific version of Singularity
```{}
module load singularity/4.1.1
```

Login to Harbor Registry
```{}
singularity registry login --username <username> docker://svlprhpcreg01.stjude.org 
```

Run from docker image (converts to SIF and stores in ~/.singularity)
```{}
singularity run docker://svlprhpcreg01.stjude.org/hpcf/<container>:<tag>
```

Build local sif file from docker image and run from local file
```{}
singularity build <container_tag>.sif docker://svlprhpcreg01.stjude.org/hpcf/<container>:<tag>
singularity run <container_tag>.sif
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



