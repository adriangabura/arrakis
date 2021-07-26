FROM certbot/certbot
ENV GOSU_VERSION=1.13

# Install socat & gosu & bash
RUN apk update && apk add socat curl bash && \
curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" && \
chmod +x /usr/local/bin/gosu && \
addgroup -g 99 -S certbot && adduser -u 99 -G certbot -S certbot && \
mkdir -p /etc/letsencrypt/ /var/log/letsencrypt/ /var/lib/letsencrypt/ && \
chown -R certbot:certbot /etc/letsencrypt/ /var/log/letsencrypt/ /var/lib/letsencrypt/

# Copy scripts
COPY --chown=certbot:certbot --chmod=754 ./scripts/ /etc/scripts/

# Expose port 380
EXPOSE 380
#USER certbot