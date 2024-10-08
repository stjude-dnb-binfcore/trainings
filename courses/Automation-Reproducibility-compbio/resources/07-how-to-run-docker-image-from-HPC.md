# ##############################################################################
# How to run Docker from a Registry and from HPC ###############################
# ##############################################################################

# Pull to HPC From Dockerhub

Pull Image From Registry → Convert to Singularity Image → Run via Singularity on HPC

⚠️ Attention! You need to login to VPN to complete the following steps.⚠️


## Start an interactive session on a compute node

Open up an interactive session on a build node. Make sure you include enough memory to build your container.

```{}
hpcf_interactive -q hprc_test -R "rusage[mem=8GB]"
```

## Load specific version of Singularity

```{}
module load singularity/4.1.1
```


## Run from docker image (converts to SIF and stores in ~/.singularity)

Use the following command: `singularity run docker://<yourhubusername>/<container>:<tag>`

Example
```{}
singularity run docker://achronistjude/single-cell-rna-analysis:latest
```

## Build sif file

Containers are typically used to run noninteractive (batch) executables on generic resources like the cloud. (i.e. submit and wait for result)

`singularity run` executes a default command defined in the container image. 


```{}
singularity run single-cell-rna-analysis:latest.sif

singularity exec -B $PWD:/research/dept/dnb/core_operations/Bioinformatics/achroni/GitHub/single-cell-rna-analysis docker://achronistjude/single-cell-rna-analysis:latest bash
```

Singularity will run and take more time to convert the first time. After this, the converted sif file will live in the home cash dir of the user. The user will still need to repeat these commands, but it will take less time to run/exec as the `run` part has been complete already. 


Now you can go to your analyses directory and run your module(s).

```{}
cd /research/dept/dnb/core_operations/Bioinformatics/achroni/GitHub/single-cell-rna-analysis
Rscript -e "rmarkdown::render(‘my-amazing-script.Rmd', clean = TRUE)"
```


**The same process/commands are necessary for users submitting a lsf job. These commands will be part of the lsf script already. **

