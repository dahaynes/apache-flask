ARG ARCH
FROM wesbarnett/ubuntu-flask:userland-${ARCH} as runtime

MAINTAINER Wes Barnett https://github.com/wesbarnett

ARG VCS_REF
ARG VCS_URL
ARG BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.build-date=$BUILD_DATE 

# install requirements
# this way when you build you won't need to install again
# ans since COPY is cached we don't need to wait
ONBUILD COPY ./requirements.txt /tmp/requirements.txt
ONBUILD RUN pip install -r /tmp/requirements.txt \
    && a2enmod ssl \
    && a2dissite 000-default.conf

ONBUILD EXPOSE 80 443

# Run the webserver
ONBUILD CMD /usr/sbin/apache2ctl -D FOREGROUND
