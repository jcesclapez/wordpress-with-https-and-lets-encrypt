FROM wordpress:latest

RUN apt-get update && \
        apt-get install -y  --no-install-recommends ssl-cert nano && \
        rm -r /var/lib/apt/lists/* && \
        a2enmod ssl && \
        a2ensite default-ssl \
        sed -i '2i RewriteEngine On' /var/www/html/.htaccess \
        sed -i '3i RewriteCond %{HTTPS} off' /var/www/html/.htaccess \
        sed -i '4i RewriteRule (.*) https://%{SERVER_NAME}/$1 [R,L]' /var/www/html/.htaccess \
        sed -i 's/_default_/$WEB_URL/g' /etc/apache2/sites-available/default-ssl.conf

ENV WEB_URL _default_

EXPOSE 80
EXPOSE 443
