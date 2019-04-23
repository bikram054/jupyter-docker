FROM alpine:latest

ENV CONDA_VERSION 4.5.12
ENV CONDA_MD5 4be03f925e992a8eda03758b72a77298

RUN addgroup -S anaconda && adduser -D -u 10151 anaconda -G anaconda && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-$CONDA_VERSION-Linux-x86_64.sh && \
    echo "${CONDA_MD5}  Miniconda2-$CONDA_VERSION-Linux-x86_64.sh" > miniconda.md5 && \
    if [ $(md5sum -c miniconda.md5 | awk '{print $2}') != "OK" ] ; then exit 1; fi && \
    mv Miniconda2-$CONDA_VERSION-Linux-x86_64.sh miniconda.sh && \
    mkdir -p /opt && sh ./miniconda.sh -b -p /opt/conda && rm miniconda.sh miniconda.md5 && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    chown -R anaconda:anaconda /opt && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> /home/anaconda/.profile && \
    echo "conda activate base" >> /home/anaconda/.profile
RUN conda install jupyter -y && mkdir /opt/notebooks
