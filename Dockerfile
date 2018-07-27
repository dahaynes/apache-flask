ARG BASE
FROM ${BASE} as base

ARG VCS_REF
ARG VCS_URL
ARG BUILD_DATE
LABEL org.label-schema.vcs-ref = $VCS_REF \
      org.label-schema.vcs-url = $VCS_URL \
      org.label-schema.build-date = $BUILD_DATE \
      maintainer = $MAINTAINER

RUN apt-get update \
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

ONBUILD CMD /usr/sbin/apache2ctl -DFOREGROUND