FROM alpine
RUN apk update &&\
    apk add nginx openssl openssh

RUN     adduser -D -g 'www' www
RUN     chown -R www:www /var/lib/nginx
RUN     chown -R www:www /var/www

COPY    nginx.conf /etc/nginx/nginx.conf
RUN     mkdir -p /var/www/html
COPY    index.html /var/www/html/index.html

RUN     mkdir -p /run/nginx

RUN     openssl req -x509 -out /etc/ssl/certs/wpadda.crt -keyout /etc/ssl/private/wpadda.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=wpadda'

RUN     adduser -D "adda-sil" && echo "adda-sil:admin" | chpasswd
RUN     ssh-keygen -A

EXPOSE 22 80 443
ENTRYPOINT nginx -g 'daemon off;'
