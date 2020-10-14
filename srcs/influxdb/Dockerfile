FROM        alpine

RUN         apk update &&\
            apk add influxdb --no-cache

EXPOSE      8086 8088

ENTRYPOINT  influxd