# ubuntu-flask

A base Docker container for running Python3 Flask/Apache applications
with an Ubuntu userland.

## Usage

This image is used as a base for Python3 Flask applications via
Apache. All you need to do is create a Dockerfile that copies your
Apache configuration files and your Flask project and then enable your
Apache configuration files. Place `requirements.txt` in the same
directory as your Dockerfile. The image automatically installs from
those requirements.

See an example [here](https://github.com/wesbarnett/movie-ratings/blob/master/Dockerfile).

When you run your image with `docker run` it will execute `apache2ctl
-D FOREGROUND`. Ports `80` and `443` are exposed, and apache modules
`rewrite` and `ssl` are enabled by default.
