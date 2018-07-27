# apache-flask

A base Docker container for running Python3 Flask/Apache applications
with an Ubuntu userland.

## Usage

This image is used as a base for Python3 Flask applications via
Apache's Web Server Gateway Interface (WSGI). All you need to do is
create a Dockerfile that copies your Apache configuration files and
your Flask project and then enable your Apache configuration files.
Alternatively mount the project and configuration files with the `-v`
flag when you use `docker run`. 

Place `requirements.txt` in the same directory as your Dockerfile for
additional Python package requirements. You need at least the `flask`
and `mod-wsgi` packages. The image then automatically installs from
those requirements. 

## Example

A minimal working example is in the `example` folder. I recommend
using this to build your Docker Flask project.

Another example using SSL is
[here](https://github.com/wesbarnett/movie-ratings/blob/master/Dockerfile).

## Docker repository

The Docker repository is located
[here](https://hub.docker.com/r/wesbarnett/apache-flask/).
