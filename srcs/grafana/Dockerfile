FROM        alpine

RUN         apk update &&\
            apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

EXPOSE      3000

COPY        datasources.yaml /usr/share/grafana/conf/provisioning/datasources/datasources.yaml
COPY        dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml

ENTRYPOINT  grafana-server --homepath /usr/share/grafana