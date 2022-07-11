# Uses Tensorflow 2.9.x on GPU and comes with jupyter
FROM tensorflow/tensorflow:latest-gpu-jupyter

# Installs repos from additional_repos.txt
COPY ./additional_repos.txt /tf/additional_repos.txt
RUN pip install -q --no-input -r /tf/additional_repos.txt
RUN rm /tf/additional_repos.txt


# Connects volumes
