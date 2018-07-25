ARG BASE
FROM ${BASE} as base

MAINTAINER Wes Barnett https://github.com/wesbarnett

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
        apache2 \
        apache2-dev \
        build-essential \
        libapache2-mod-wsgi-py3 \
        python3-dev \
        python3-pip \
        python3-setuptools\
        vim \
    && apt-get clean \ 
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade pip

ARG VCS_REF
ARG VCS_URL
ARG BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.build-date=$BUILD_DATE
