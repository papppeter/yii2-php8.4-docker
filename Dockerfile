FROM yiisoftware/yii2-php:7.4-apache

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install curl gnupg zlib1g-dev
RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash -
RUN apt-get -y install nodejs
RUN apt-get install -y autossh
RUN apt-get install -y systemd
RUN docker-php-ext-install sockets

RUN apt-get install -y git zip

RUN apt install -y libnss3-tools
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null \
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile \
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
RUN brew install mkcert
RUN brew install grpc

RUN a2enmod ssl
