ARG BASE
FROM ${BASE} as base

ARG GIT_COMMIT
ARG GIT_URL
ARG BUILD_DATE
ARG MAINTAINER
LABEL git-commit = $GIT_COMMIT
LABEL git-url = $GIT_URL
LABEL build-date = $BUILD_DATE
LABEL maintainer = $MAINTAINER

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
    && apt-get clean \ 
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade pip

ONBUILD COPY ./requirements.txt /tmp/requirements.txt
ONBUILD RUN pip --no-cache-dir install -r /tmp/requirements.txt \
    && a2enmod ssl \
    && a2dissite 000-default.conf

ONBUILD EXPOSE 80 443

ONBUILD CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
