FROM pytorch/pytorch:latest

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim \
    wget \
    build-essential

# Install required pip packages
ARG PIP=pip3
RUN ${PIP} --no-cache-dir install --upgrade pip
COPY ./requirements.txt ./
RUN ${PIP} install --upgrade pip \
   && ${PIP} install --no-cache-dir -r requirements.txt \
   && rm requirements.txt

# Specify working dir for a project
ARG WORKING_DIR=/usr/src/app
WORKDIR ${WORKING_DIR}

# Customize command prompt
RUN echo 'PS1="problem-solving>:\w\$ "' >> /etc/bash.bashrc

# Create a non-root user and switch to it (for Jupyter to work)
RUN useradd -m localuser
USER localuser
ENV HOME /home/localuser
