FROM yiisoftware/yii2-php:8.3-apache

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update -y
RUN apt-get install nodejs -y
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
RUN curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" \
  && chmod +x mkcert-v*-linux-amd64 \
  && cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

#install yarn
RUN corepack enable
#add user to apache https://cloudkul.com/blog/apache-virtual-hosting-with-different-users/
RUN apt-get install -y \
		sudo \
		mc \
;
RUN docker-php-ext-enable xdebug;

#update

EXPOSE 80

ARG UID=1000

#add user for yii binary
RUN addgroup --gid ${UID} yii
RUN adduser --uid ${UID} --gid ${UID} yii
RUN adduser yii sudo
RUN adduser yii root

RUN echo 'yii ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER yii:yii

#set workdir for app
WORKDIR /app
