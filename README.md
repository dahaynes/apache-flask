# apache-flask

A base Docker container for running Python3 Flask/Apache applications
with an Ubuntu userland.

## Usage

This image is used as a base for Python3 Flask applications via
Apache's Web Server Gateway Interface (WSGI). All you need to do is
create a Dockerfile that copies your Apache configuration files and
your Flask project and then enable your Apache configuration files.
Place `requirements.txt` in the same directory as your Dockerfile for
additional requirements. The image then automatically installs from
those requirements. `flask`, `flask-wtf`, and `mod-wsgi` are all
preinstalled in this image, along with their requirements.

A minimal Dockerfile looks like:

    FROM wesbarnett/apache-flask:bionic-x86_64

    # Copy and enable Apache configuration files
    COPY default.conf /etc/apache2/sites-available/
    RUN a2ensite default

    # Copy application data
    COPY --chown=www-data application /var/www/apache-flask/application

Then to build do:

    # docker build -t apache-flask .

Then to run do:

    # docker run -v /etc/letsencrypt:/etc/letsencrypt -p 80:80 -p 443:443 -d apache-flask

In the example above I mounted `/etc/letsencrypt` directory such that
I could use SSL certs from Let's Encrypt.

* [Example Dockerfile](https://github.com/wesbarnett/movie-ratings/blob/master/Dockerfile).
* [Example Apache configs](https://github.com/wesbarnett/movie-ratings/tree/master/apache)

The Docker repository is located
[here](https://hub.docker.com/r/wesbarnett/apache-flask/).

When you run your image with `docker run` it will execute `apache2ctl
-D FOREGROUND`. Ports `80` and `443` are exposed, and apache module
`ssl` is enabled by default.
