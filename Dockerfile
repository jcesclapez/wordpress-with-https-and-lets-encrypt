FROM wordpress:latest

RUN apt-get update && \
        apt-get install -y  --no-install-recommends ssl-cert nano && \
        rm -r /var/lib/apt/lists/* && \
        a2enmod ssl && \
        a2ensite default-ssl 

ADD .htaccess /var/www/html/

ENV WEB_URL _default_

EXPOSE 80
EXPOSE 443
