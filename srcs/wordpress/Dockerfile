FROM alpine
RUN apk update &&\
    apk add nginx

RUN     adduser -D -g 'www' www
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /var/www

COPY    nginx.conf /etc/nginx/nginx.conf
COPY    phpmyadmin.sh /tmp/phpmyadmin.sh
RUN     mkdir -p /var/www/html
COPY    index.html /var/www/html/index.html

RUN     mkdir -p /run/nginx

EXPOSE 22 80 443
ENTRYPOINT nginx -g 'daemon off;'
