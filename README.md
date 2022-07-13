# Welcome to tf-template

This repository is a template for creating TensorFlow projects in Docker on Ubuntu with NVIDIA GPU support.

base_packages.txt contains a list of the python packages already installed in the base Tensorflow image.  
additional_packages.txt contains additional repos that will be pip installed into the container


# Getting Started

1. Follow the instructions in NVIDIA_README.md to install Docker on Ubuntu 20.04 LTS with NVIDIA GPU support.
2. Clone or fork this repo.
3. Add required pip packages that aren't included in the base image **base-packages.txt** to **additional_packages.txt**.  Use the same formatting as pip **requirements.txt**.
4. Check volume mounting.  By default, **./data** and **./project** are mapped to **/tf/data** and **/tf/project**.  You may want to mount the data volume on the host from a different location.
5. Build the container.
Run:  `$ docker build -t my-tf:2.9 .`

6. Use Docker compose to start the container.
Run:  `$ docker compose up`

7. Check that TensorFlow is running properly with GPU support by running **Test_TF.ipynb**.
8. Stopping the container:
Run:  `$ docker compose stop`
9. Starting the container again:
Run:  `$ docker compose start` 



## Changing the Mount Location for ./data
To change the folder/volume on the host that gets mounted into the container, edit **docker-compose.yaml**.  In the below sample from **docker-compose.yaml**, edit the third  line and change **./data** to the directory containing your data.
```
volumes:
    # Mounts the volume holding the data
    - ./data:/tf/data
    # Mounts hte volume holding project code files
    - ./project:/tf/project
```

