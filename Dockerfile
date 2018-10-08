# This is an alpine linux installation for implementation of LSDTopoTools
# Please see documentation
# https://lsdtopotools.github.io/LSDTT_documentation/
# This container can be found at
# https://hub.docker.com/r/lsdtopotools/lsdtt_alpine_docker/
# It is a lightweight distribution, for the full LSDTopoTools distribution, 
# please see https://github.com/LSDtopotools/lsdtt_pcl_docker

FROM alpine
MAINTAINER Simon Mudd (simon.m.mudd@ed.ac.uk) and Fiona Clubb (clubb@uni-potsdam.de)

# install essential packages
RUN apk upgrade -U && \
    apk update && \
    apk add bash && \
    apk add --virtual build-dependencies build-base gcc wget git && \
    apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libressl2.7-libcrypto && \
    apk add gdal --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add fftw-dev cmake && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# update to avoid weird apk error 
RUN apk update

# Add an LSDTopoTools working directory
WORKDIR /LSDTopoTools/

# Copy the startup script
COPY Start_LSDTT.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/Start_LSDTT.sh
