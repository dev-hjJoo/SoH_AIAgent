FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

# ARGUMENTS
ARG GIT_BRANCH

RUN echo ${LOCAL_FILE}

# Home Binary Directory
ENV HOME='/home'
RUN mkdir -p $HOME/bin

# Linux Packages
RUN apt update -y && \
    apt upgrade -y
RUN apt-get install -y \
    sudo=1.9.9-1ubuntu2.4 \
    git=1:2.34.1-1ubuntu1.11 \
    curl

# Miniconda3 py312_24.1.2
RUN curl -o miniconda3.sh -L "https://repo.anaconda.com/miniconda/Miniconda3-py312_24.1.2-0-Linux-x86_64.sh"
RUN echo "b978856ec3c826eb495b60e3fffe621f670c101150ebcbdeede4f961f22dc438 miniconda3.sh" | sha256sum --check --status
RUN chmod 755 ./miniconda3.sh && \
    ./miniconda3.sh -b -p $HOME/miniconda3 && \
    rm ./miniconda3.sh && \
    echo -e "\n. ${HOME}/miniconda3/etc/profile.d/conda.sh\nconda activate base" >> ~/.bashrc
ENV PATH="${PATH}:${HOME}/miniconda3/bin"
RUN . $HOME/miniconda3/etc/profile.d/conda.sh && \
    conda activate base && \
    conda update -n base -c defaults conda --yes

# Clone SoH Repository
WORKDIR ${HOME}
RUN git clone -b ${GIT_BRANCH} "https://github.com/dev-hjJoo/SoH_AIAgent.git" && \
    ${HOME}/SoH_AIAgent/scripts/install.sh

# Entry Point
WORKDIR ${HOME}/SoH_AIAgent
ENTRYPOINT scripts/run.sh