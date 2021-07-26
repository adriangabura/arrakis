#!/bin/bash

cd /var/www/html/$PROJECT_NAME

# Building args
args=( \
 "--base-url=$BASE_URL" \
 "--backend-frontname=admin" \
 "--db-host=mysql" \
 "--db-name=$MYSQL_DATABASE" \
 "--db-user=$MYSQL_USER" \
 "--db-password=$MYSQL_PASSWORD" \
 "--admin-firstname=admin" \
 "--admin-lastname=admin" \
 "--admin-email=admin@admin.com" \
 "--admin-user=$MAGENTO_ADMIN_USER" \
 "--admin-password=$MAGENTO_ADMIN_PASSWORD" \
 "--language=en_US" \
 "--currency=USD" \
 "--timezone=America/Chicago" \
 "--use-rewrites=1" \
 "--search-engine=elasticsearch7" \
 "--elasticsearch-enable-auth=1" \
 "--elasticsearch-host=elasticsearch" \
 "--elasticsearch-username=elastic" \
 "--elasticsearch-password=$ELASTIC_PASSWORD" \
 "--elasticsearch-port=9200" \
 "--elasticsearch-index-prefix="elastic.magento2"" \
 "--amqp-host=rabbitmq" \
 "--amqp-user=$RABBITMQ_DEFAULT_USER" \
 "--amqp-password=$RABBITMQ_DEFAULT_PASS" \
 "--amqp-port=5672" \
)

bin/magento setup:install "${args[@]}"