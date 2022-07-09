# Installing Docker with NVIDIA Support

## Why Use Docker with NVIDIA Support
Docker provides a containerized runtime allowing programs to run in isolated environments.  Running TensorFlow inside Docker makes it so that only the GPU device drivers need to be installed on the host machine and it makes it easy to put code into production or move it to another machine.

## Installation Guide
For newer instructions, you might want to visit [Official TensorFlow installation guide](www.tensorflow.org/install/docker).  This guide assumes we are installing on Ubuntu 20.04 LTS.

### Installing Docker Engine
Do not use Docker Desktop for this, only the Docker Engine.  Docker Desktop runs containers on a VM (even on Linux) which is slower and makes it harder to install the propper drivers and connections.
[Official Guide](https://docs.docker.com/engine/install/ubuntu/)

**Uninstall old versions**
```
 $ sudo apt-get remove docker docker-engine docker.io containerd runc
```

**Installing latest version**
1. Set up the repository
```
$ sudo apt-get update

$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

$ sudo mkdir -p /etc/apt/keyrings

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

2. Install Docker Engine
```
$ sudo apt-get update

$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

3. Verify that Docker Engine is installed correctly by running the `hello-world` image.
```
$ sudo docker run hello-world
```

### Installing NVIDIA Container Toolkit
The NVIDIA Container Toolkit now needs to be installed. [Official GitHub](https://github.com/NVIDIA/nvidia-docker) [Official NVIDIA Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)

**Requirements**
1.  GNU/Linux x86_64 with kernel version > 3.10
Check by running:  `$ hostnamectl`
    
2.  Docker >= 19.03 (recommended, but some distributions may include older versions of Docker. The minimum supported version is 1.12)
Check by running:  `$ docker -v`
    
3.  NVIDIA GPU with Architecture >= Kepler (or compute capability 3.0)
    
4.  [NVIDIA Linux drivers](http://www.nvidia.com/object/unix.html)  >= 418.81.07 (Note that older driver releases or branches are unsupported.)
Check by running:  `$ nvidia-smi`
They can be installed on Ubuntu with the **Software & Updates** program under the **Additional Drivers** tab.

5. Check that the gpu is available.
Run:  `$ lspci | grep -i nvidia`

**Setup the package repository and the GPG key**
```
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

**Install the `nvidia-docker2` package (and dependencies) after updating the package listing**
```
$ sudo apt-get update

$ sudo apt-get install -y nvidia-docker2
```

**Restart the Docker daemon to complete the installation after setting the default runtime**
```
$ sudo systemctl restart docker
```

**Test the working setup**
```
$ sudo docker run --gpus all --rm nvidia/cuda:11.0-base nvidia-smi
```
This output from inside the container should look similar to the output from the host OS.
```
$ nvidia-smi
```

**Enabling GPU persistence**
For more information see [Nvidia.com](https://docs.nvidia.com/deploy/driver-persistence/index.html).
```
$ sudo nvidia-smi -pm 1
```


## Running Containers
-   Take note of your Docker version with  `docker -v`.  On versions  **including and after**  19.03, you will use the  `nvidia-container-toolkit`  package and the  `--gpus all`  flag.

