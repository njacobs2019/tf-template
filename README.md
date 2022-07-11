# Welcome to tf-template

This repo is a template for creating TensorFlow projects in Docker.

included_repos.txt contains a list of the python packages already installed in the base Tensorflow image


# Getting Started

1. Follow the instructions in NVIDIA_README.md this will help you install Docker on Ubuntu 20.04 LTS with NVIDIA GPU support.
2. Clone or fork this repo.
3. Add pip packages to be installed in the requirements.txt file.
4. Configure and build the Docker image.
5. Use Docker compose to start the container.
6. Check that everything works by running the Test_TF notebook.


## Build the docker container
```
$ docker build -t my-tf:1.3 .
```


## Running the container
```
docker compose up
```


## If docker-compose is not installed:
Run:  
```
$ apt install docker-compose -y
```


## Notes:
This was originally setup with the following components and resulted in the following environment on 7/11/2022.  
System:  
- i7-4770k with NVIDIA 3060ti
- Ubuntu 20.04.4 LTS

Environment:  
- Docker version 20.10.17, build 100c701
- Docker Compose version v2.6.0
