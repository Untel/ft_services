FROM alpine

USER root

RUN apk update &&\
    apk add mysql mysql-client

COPY mysql.sh /tmp/mysql.sh
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
COPY req.sql /tmp/req.sql

ENTRYPOINT sh /tmp/mysql.sh
