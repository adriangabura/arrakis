#!/bin/bash

cd /var/www/html && \
composer config --global http-basic.repo.magento.com $MAGENTO_PUBLIC_KEY $MAGENTO_PRIVATE_KEY && \
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition $PROJECT_NAME