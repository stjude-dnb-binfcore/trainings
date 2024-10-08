# #######################################
# How to use Docker on a MAC OS #########
# #######################################

## First things, first!
Now that you have successfully installed Docker desktop app, let's start using it!

(1) Make sure that the Docker desktop app starts running every time you start your computer. It will make your life easier. This will get the docker daemon running which is a linux VM on your local workstation. This will allow you to access the Docker container and push/pull your Docker image.
(2) Check that you're correctly login in your Docker account in the Docker desktop app.
(3) Turn off cloudflare and VPN as these might create verification issues while trying to login.


## Open a Terminal

Next, you will go to the command line and type the following with your Docker username/password.
`docker login –u <your_username>`

Example:
```{}
docker login –u achronistjude
```

🎉 Login Succeeded!


# ########################################################################################################################
If you encounter issues during the login, from your `home_dir`, e.g. `/Users/achroni`, do the following:
```{}
rm -fr ~/.docker
```

This just caches history and user info. When you restart docker desktop, you will have to log in again and it will create a fresh `.docker` folder. Then, shutdown the docker desktop app, restart, and open a new terminal window, and now hopefully, it works!
# ########################################################################################################################


## Step-by-Step Guide to Build and Push a Docker Image
Now we will build our own custom Docker image and push it to registry.
We will do this locally (for security reasons) and then we can use and run it from wherever we want, e.g. `HPC`. We will see how to do this later.


### Create custom Docker image

#### Create/Download the Dockerfile that contains all packages that you will need for your project. 
The [Rocker Project](https://www.rocker-project.org/) provides and maintains several Docker images very useful when working with R programming language. For more information, please advise [Rocker](https://arca-dpss.github.io/manual-open-science/rocker-chapter.html).

This will be a file named `Dockerfile` in your project directory. This file contains the instructions for building your Docker image.

#### Open a Terminal
Navigate to the directory containing your Dockerfile using a terminal or command prompt: `cd path/to/your/project`

Example:
```{}
cd /Users/achroni/my_favorite_repo
```

#### Build the Docker Image
Use the docker build command to create the image. The -t flag allows you to tag your image with a name and version: `docker build --platform linux/amd64 -t your-image-name:your-tag .` The . at the end specifies the build context, which is the current directory.

Example:
```{}
docker build --platform linux/amd64 -t my_favorite_repo:latest .
```

#### Verify the Image
Check if your image was built correctly.

```{}
docker images
```

This will provide you with the list with all Docker images along with their image IDs available at your docker daemon. The list is also visible can at the `Docker desktop app`.


#### Tag the Image
If you want to push the image to a registry, you may need to tag it appropriately: `docker tag your-image-name:your-tag <registry>/<namespace>/<repository>:<tag>`

Example:
```{}
docker tag my_favorite_repo:latest <registry>/<namespace>/my_favorite_repo:latest
```

**MINE**
```{}
docker tag single-cell-rna-analysis:latest svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest
```

#### Manage the Docker Image
Please check the [Manage the Docker Image](https://jhudatascience.org/Adv_Reproducibility_in_Cancer_Informatics/modifying-a-docker-image.html) resource on how to modify and manage Docker images.


### Push the Image 
If you want to share your image or deploy it elsewhere, push it to a Docker registry.

#### Login to the Registry
Log in to your Docker registry to authenticate. You'll be prompted for your username and password. For St Jude employees, this will be your St Jude username/password: `docker login <registry>`

Example:
```{}
docker login <registry>
```

**MINE**
```{}
docker login svlprhpcreg01.stjude.org
```

#### Push the Image to the Registry
Then, use the docker push command to upload your image to the registry: docker push <registry>/<namespace>/my_favorite_repo:latest

Example:
```{}
docker push <registry>/<namespace>/my_favorite_repo:latest
```

**MINE**
```{}
docker push svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest
```

## Run the Image from a Registry
Once the Docker image is built, you can start using it 😀 
This can be before/after/regardless pushing the Docker image to a registry.

(1) Navigate to the directory containing your Dockerfile and `my_favorite_repo` using a terminal or command prompt: `cd path/to/your/project`

Example:
```{}
cd /Users/<my_username>/my_favorite_repo
```

(2) Then you can run the docker and create your docker container. The docker container can be unique and new one every time you run/execute a new set of analyses, e.g. name it here as `review`. 

Example:
```{}
docker run --platform linux/amd64 --name review -d -e PASSWORD=ANYTHING -p 8787:8787 -v $PWD:/home/rstudio/my_favorite_repo <registry>/<namespace>/my_favorite_repo:latest
docker container start review
```

If you go to the Docker desktop app, you will see the container running. 🙌

**MINE**
```{}
docker run --platform linux/amd64 --name review -d -e PASSWORD=ANYTHING -p 8787:8787 -v $PWD:/home/rstudio/single-cell-rna-analysis svlprhpcreg01.stjude.org/hpcf/single-cell-rna-analysis:latest
docker container start review
```


(3) Once you execute the container, you can move to the directory and start running scripts related to your analyses!

```{}
docker exec -ti review bash

cd /home/rstudio/my_favorite_repo
Rscript -e "rmarkdown::render(‘my-amazing-script.Rmd', clean = TRUE)"
```


**MINE**
```{}
docker exec -ti review bash

cd /home/rstudio/single-cell-RNA-analysis
Rscript -e "rmarkdown::render(‘my-script.Rmd', clean = TRUE)"
```

## Run the Image from a Registry and from HPC







## Stop/Remove the Image from a Registry
Once you finish with your analyses, you should stop the container.
```{}
docker stop review
```

To verify the container has stopped, you can check the list of running containers again to ensure it has stopped:
```{}
docker ps
```

If you do not need the container, it is recommended to remove it to save space. 
```{}
docker rm review
```


