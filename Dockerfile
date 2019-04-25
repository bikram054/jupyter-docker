FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget -y && wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
	bash ~/miniconda.sh -b -p ~/miniconda && rm ~/miniconda.sh && export PATH=~/miniconda/bin:$PATH
