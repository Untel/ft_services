FROM alpine
RUN apk update &&\
    apk add vsftpd openssl

COPY vsftpd.conf /etc/vstpd/vstpd.conf

RUN     adduser -D "adda-sil" && echo "adda-sil:adda-sil" | chpasswd

RUN     openssl req -x509 -out /etc/ssl/certs/adda-sil_ftps.crt -keyout /etc/ssl/private/adda-sil_ftps.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=adda-sil_ftps'

EXPOSE 20 21 1664

ENTRYPOINT ["vsftpd", "/etc/vstpd/vstpd.conf"]
