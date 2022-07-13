# Uses Tensorflow 2.9.x on GPU and comes with jupyter
FROM tensorflow/tensorflow:latest-gpu-jupyter

# Installs repos from additional_repos.txt
COPY ./additional_packages.txt /tf/additional_packages.txt
RUN pip install -q --no-input -r /tf/additional_packages.txt
RUN rm /tf/additional_packages.txt

# Copies Test_TF.ipynb
COPY ./Test_TF.ipynb /tf/Test_TF.ipynb
