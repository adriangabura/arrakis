FROM haproxy:2.4.2
ENV GOSU_VERSION=1.13
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
#VOLUME [ "/usr/local/etc/haproxy/" ]
USER root
RUN mkdir -p /run/haproxy && chown -R haproxy:haproxy /run/haproxy && \
apt-get update && apt-get install -y curl openssl socat iputils-ping && \
curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" && \
chmod +x /usr/local/bin/gosu && \
mkdir -p /usr/local/etc/haproxy/certificates && chown -R haproxy:haproxy /usr/local/etc/haproxy/certificates && \
cd /usr/local/etc/haproxy/certificates && gosu haproxy openssl req -nodes -x509 -subj "/C=PE/ST=Lima/L=Lima/O=Acme Inc. /OU=IT Department/CN=acme.com" -newkey rsa:2048 -keyout test.key -out test.crt -days 30 && \
gosu haproxy cat test.crt test.key > test.pem && rm test.crt && rm test.key
USER haproxy