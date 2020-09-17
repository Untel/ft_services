FROM alpine
RUN apk update &&\
    apk add nginx

WORKDIR /etc/nginx
COPY srcs/nginx/nginx.conf conf.d/nginx.conf

COPY srcs/nginx/nginx.sh /tmp/nginx.conf

EXPOSE 80 443
ENTRYPOINT sh /tmp/nginx.sh
