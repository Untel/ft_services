FROM        alpine

RUN         apk update &&\
            apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

ENTRYPOINT  telegraf