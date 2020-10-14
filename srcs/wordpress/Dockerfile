FROM      alpine

RUN       apk update &&\
          apk add --no-cache supervisor &&\
          apk add nginx curl php7-phar php7-session php7-fpm php7-mbstring lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN       adduser -D -g 'www' www
RUN       chown -R www:www /var/lib/nginx
RUN       chown -R www:www /var/www

COPY      nginx.conf /etc/nginx/nginx.conf
RUN       mkdir -p /var/www

WORKDIR   /tmp
RUN       curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN       chmod +x wp-cli.phar
RUN       mv wp-cli.phar /usr/local/bin/wp
COPY      wordpress.sh /tmp/wordpress.sh

RUN       mkdir -p /run/nginx
COPY      supervisord.conf /etc/supervisord.conf

WORKDIR   /var/www
RUN       su -c 'wp core download --path=/var/www' - www
COPY      wp-config.php wp-config.php

WORKDIR   /
EXPOSE    5050

ENTRYPOINT sh /tmp/wordpress.sh;
