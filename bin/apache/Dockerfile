FROM fedora
ENV GOSU_VERSION=1.13
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu && \
    dnf update -y && dnf install -y socat iputils httpd httpd-tools php php-cli php-php-gettext php-mcrypt \
    php-pear php-mysqlnd php-xml php-intl php-curl php-bcmath php-gd php-mbstring php-soap \
    php-zip php-sodium composer unzip && \
    usermod -u 1000 apache && \
    groupmod -g 1000 apache && \
    mkdir /etc/httpd/sites-available && mkdir /etc/httpd/sites-enabled && \
    echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /var/www/html /usr/share/httpd /run/httpd /etc/httpd \
    /var/log/httpd /usr/lib64/httpd/modules /var/lib/httpd

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY magento.conf /etc/httpd/sites-available/
# Copy scripts
COPY --chown=apache:apache --chmod=754 ./scripts/ /usr/local/bin
#RUN ln -s /etc/httpd/sites-available/magento.conf /etc/httpd/sites-enabled/magento.conf 

#RUN rm /etc/httpd/conf.d/ssl.conf
#COPY ./ssl.conf /etc/httpd/conf.d/ssl.conf
#RUN dnf update && dnf install -y 

WORKDIR /var/www/html
USER apache

EXPOSE 80
#ENTRYPOINT [ "/bin/bash", "-c" ]
#ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]