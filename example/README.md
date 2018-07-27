# wesbarnett/apache-flask example

This is a minimal example of a Flask Docker application that uses the
`wesbarnett/apache-flask` image as a base. It includes sending the
Apache log to the host system's log.

The `requirements.txt` file only contains `flask` and `mod-wsgi`. Add
additional required Python3 packages to that file if needed.

## Build

To build this Docker image do:

    docker build -t flaskapp .

## Run

To run the image:

    docker run -v /dev/log:/dev/log -p 80:80 -d flaskapp

## Test

To test do:

    curl localhost

You should see "It works!". Additionally you should now have an entry
in the host system's system log indicating that the website was
accessed.
