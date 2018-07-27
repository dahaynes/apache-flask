FROM wesbarnett/apache-flask:bionic-x86_64

COPY apache/* /etc/apache2/sites-available/
RUN a2ensite default

COPY --chown=www-data application /var/www/apache-flask/application
