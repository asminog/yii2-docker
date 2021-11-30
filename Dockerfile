FROM php:7.4.26-fpm
MAINTAINER asminog <asminog@asminog.com>

ENV DEBIAN_FRONTEND=noninteractive

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && install-php-extensions \
	# amqp \
	apcu \
	# apcu_bc \
	bcmath \
	# bz2 \
	# calendar \
	# cmark \
	# ctype \ 		# installed by default
	# curl \ 		# installed by default
	# dba \
	# decimal \
	# dom \ 		# installed by tefault
	# enchant \
	# ev \
	exif \
	# fileinfo \	# installed by default
	# ffi \
	# ftp \			# installed by default
	gd \
	# gettext \
	# gmagick \
	# gmp \
	# gnupg \
	# grpc \
	# http \
	# iconv \		# installed by default
	# igbinary \
	imagick \
	# imap \
	# interbase \
	intl \
	# ioncube_loader \
	# json \
	# ldap \
	# mailparse \
	# maxminddb \
	# mbstring \	# installed by default
	# mcrypt
	# memcache \
	# memcached \
	# mongo \
	# mongodb \
	# mosquitto \
	# msgpack \
	# mssql \
	# mysql \
	mysqli \
	# oauth \
	# oci8 \
	# odbc \
	opcache \
	# opencensus \
	# parallel \
	# pcntl \
	# pcov \
	# pdo \			# installed by default
	# pdo_dblib \
	# pdo_firebird \
	pdo_mysql \
	# pdo_oci \
	# pdo_odbc \
	 pdo_pgsql \
	# pdo_sqlite \	# installed by default
	# pdo_sqlsrv
	# pgsql \
	# phar \		# installed by default
	# propro \
	# protobuf \
	# pspell \
	# pthreads \
	# posix \		# installed by default
	# raphf \
	# readline \	# installed by default
	# rdkafka \
	# recode \
	redis \
	# session \		# installed by default
	# shmop \
	# simplexml \	# installed by default
	# smbclient \
	# snmp \
	# snuffleupagus \
	soap \
	# sockets \
	# sodium \ 		# installed by default
	# solr \
	# sqlsrv \
	# ssh2 \
	# swoole \
	# sybase_ct \
	# sysvmsg \
	# sysvsem \
	# sysvshm \
	# tdlib
	# tidy \
	# timezonedb \
	# tokenizer \
	# uopz \
	# uuid \
	# wddx \
	xdebug \
	# xhprof \
	# xlswriter \
	# xmlrpc \
	# xsl \
	# yaml \
	# yar \
	zip \
	# zookeeper \
#	@composer
	 @composer-1

ENV	COMPOSER_ALLOW_SUPERUSER=1 \
    PHP_USER_ID=501 \
    PHP_ENVIRONMENT=prod \
    PHP_ENABLE_XDEBUG=0 \
    PATH=/app:/app/vendor/bin:/root/.composer/vendor/bin:$PATH \
    TERM=linux \
    VERSION_PRESTISSIMO_PLUGIN=^0.3.10

# Install composer plugins
RUN composer global require --optimize-autoloader "hirak/prestissimo:${VERSION_PRESTISSIMO_PLUGIN}" && \
 composer global dumpautoload --optimize && \
 composer clear-cache && \
 mv /usr/local/bin/composer /usr/local/bin/composer.phar

# Add configuration files
COPY image-files/ /
RUN chmod 711  /usr/local/bin/*

# Install Yii framework bash autocompletion
RUN curl -L https://raw.githubusercontent.com/yiisoft/yii2/master/contrib/completion/bash/yii \
        -o /etc/bash_completion.d/yii

WORKDIR /app