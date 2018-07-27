This is a minimal example of a Flask Docker application that uses the
`wesbarnett/apache-flask` image as a base. It includes sending the
Apache log to the host system's log.

The `requirements.txt` file is currently empty. Add the required
Python3 packages to that file if needed.

To build this Docker image do:

    docker build -t flaskapp .

To run the image do:

    docker run -v /dev/log:/dev/log -p 80:80 -d flaskapp
