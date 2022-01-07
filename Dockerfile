FROM yiisoftware/yii2-php:7.4-apache

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install curl gnupg zlib1g-dev
RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash -
RUN apt-get -y install nodejs
RUN apt-get install -y autossh
RUN apt-get install -y systemd
RUN docker-php-ext-install sockets
RUN pecl install grpc
