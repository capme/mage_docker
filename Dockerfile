FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:nginx/stable -y
RUN add-apt-repository ppa:ondrej/mysql-5.6 -y
RUN apt-get update
RUN apt-get install -y --force-yes php5-fpm nginx php5-mysql php5-mcrypt php5-gd php5-curl php5-xdebug mysql-server
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
WORKDIR /etc/nginx/sites-enabled
ADD nginx/sites-available/default /etc/nginx/sites-available/default
ADD nginx/conf.d/php-fpm /etc/nginx/conf.d/php-fpm
RUN echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/info.php
