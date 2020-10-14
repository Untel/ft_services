FROM      alpine

USER      root

RUN       apk update &&\
          apk add --no-cache supervisor &&\
          apk add nginx php7-session php7-fpm php7-mbstring lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN       adduser -D -g 'www' www
RUN       chown -R www:www /var/lib/nginx
RUN       chown -R www:www /var/www

COPY      nginx.conf /etc/nginx/nginx.conf
RUN       mkdir -p /var/www/html

WORKDIR   /var/www/html
COPY      phpMyAdmin.tar.gz .
RUN       tar -xvf phpMyAdmin.tar.gz && mv phpMyAdmin-4.9.4-all-languages phpmyadmin && rm phpMyAdmin.tar.gz
COPY      config.inc.php phpmyadmin/config.inc.php

WORKDIR   /
RUN       mkdir -p /run/nginx

COPY      supervisord.conf /etc/supervisord.conf

EXPOSE    5000

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
