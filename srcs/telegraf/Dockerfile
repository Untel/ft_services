FROM        alpine

ENV         TELEGRAF_VERSION 1.6.1
ADD         https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz ./

RUN         mkdir /etc/telegraf
RUN         tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz
RUN         chmod +x telegraf/*
RUN         cp telegraf/telegraf /usr/bin/
RUN         ls telegraf*
RUN         rm -rf *.tar.gz* telegraf/
RUN         ls /usr/bin/tel*

RUN         ls /etc/telegraf
ENTRYPOINT  /usr/bin/telegraf