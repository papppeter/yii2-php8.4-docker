FROM yiisoftware/yii2-php:7.4-apache

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install curl gnupg zlib1g-dev
RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash -
RUN apt-get -y install nodejs
RUN apt-get install -y autossh
RUN apt-get install -y systemd
RUN docker-php-ext-install sockets

RUN apt-get install -y git zip locales locales-all mc build-essential

# Set the locale
RUN sed -i '/en_GB.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_GB:en  
ENV LC_ALL en_GB.UTF-8  

RUN apt install -y libnss3-tools
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

RUN git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew/Homebrew \
	&& mkdir /home/linuxbrew/.linuxbrew/bin \
	&& ln -s ../Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/ \
	&& brew config

RUN brew install mkcert
RUN brew install grpc
