FROM php:8.4.13-fpm
LABEL org.opencontainers.image.authors="asminog <asminog@asminog.com>"

ENV DEBIAN_FRONTEND=noninteractive \
    COMPOSER_ALLOW_SUPERUSER=1 \
    PHP_USER_ID=501 \
    PHP_ENVIRONMENT=prod \
    PATH=/app:/app/vendor/bin:/root/.composer/vendor/bin:$PATH

RUN curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions && install-php-extensions \
	# amqp \
	apcu \
	# apcu_bc \
    # ast \
	bcmath \
    # bitset \
    # blackfire \
    # brotli \
	# bz2 \
	# calendar \
    # cassandra \
	# cmark \
    # csv \
	# dba \
    # ddtrace \
	# decimal \
	# ds \
    # ecma_intl \
	# enchant \
	# ev \
    # event \
    # excimer \
	exif \
	# ffi \
	# ftp \
	gd \
    # gearman \
    # geoip \
    # geos \
    # geospatial \
	# gettext \
	# gmagick \
	# gmp \
	gnupg \
	grpc \
	# http \
	# igbinary \
	imagick \
	# imap \
    # inotify \
	# interbase \
	intl \
    # ion \
	# ioncube_loader \
    # jsmin \
    # json_post \
    # jsonpath \
	# ldap \
    # luasandbox \
    # lz4 \
    # lzf \
	# mailparse \
	# maxminddb \
	# mcrypt \
    # md4c \
	# memcache \
	# memcached \
    # memprof \
	# mongo \
	 mongodb \
	# mosquitto \
	# msgpack \
	# mssql \
	# mysql \
	mysqli \
    # newrelic
	# oauth \
	# oci8 \
	# odbc \
	opcache \
	# opencensus \
    # openswoole \
    # opentelemetry \
    # operator \
	# parallel \
    # parle \
	# pcntl \
	# pcov \
	# pdo_dblib \
	# pdo_firebird \
	pdo_mysql \
	# pdo_oci \
	# pdo_odbc \
	pdo_pgsql \
	# pdo_sqlsrv
	pgsql \
    # phalcon \
    # php_trie \
    # phpy \
    # pkcs11 \
    # pq \
	# propro \
	# protobuf \
	# pspell \
    # psr \
	# pthreads \
    # raphf \
    # rdkafka \
	# recode \
	redis \
    # relay \
    # saxon \
    # seasclick \
    # seaslog \
	# shmop \
	# simdjson \
	# smbclient \
    # snappy \
	# snmp \
	# snuffleupagus \
	soap \
	sockets \
	# sodium \
	# solr \
    # sourceguardian \
    # spx \
	# sqlsrv \
	# ssh2 \
    # stomp \
	# swoole \
	# sybase_ct \
    # sync \
	# sysvmsg \
	# sysvsem \
	# sysvshm \
    # tensor \
    # tideways \
	# tidy \
	# timezonedb \
	# uopz \
    # uploadprogress \
	# uuid \
    # uv \
    # vips \
    # vld \
	# wddx \
    # wikidiff2 \
	xdebug \
    # xdiff \
	# xhprof \
	# xlswriter \
    # xmldiff \
	# xmlrpc \
    # xpass \
	# xsl \
    # yac \
	# yaml \
	# yar \
    # zephir_parser \
	zip \
    # zmq \
	# zookeeper \
    # zstd \
    # @fix_letsencrypt \
	@composer

# Install composer
RUN mv /usr/local/bin/composer /usr/local/bin/composer.phar && \
# Install Symfony CLI \
# ALPINE
#    apk add --no-cache bash git bash-completion && \
#    curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash && \
#    apk add symfony-cli && \
#    rm -rf /var/cache/apk/* && \
#    curl -L https://raw.githubusercontent.com/yiisoft/yii2/master/contrib/completion/bash/yii \
#        -o /usr/share/bash-completion/completions/yii
# DEBIAN
    echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list && \
    apt update && \
    apt install symfony-cli -y && \
    rm -rf /var/lib/apt/lists/* && \
# Install Yii framework bash autocompletion
    curl -L https://raw.githubusercontent.com/yiisoft/yii2/master/contrib/completion/bash/yii \
        -o /etc/bash_completion.d/yii

# Add configuration files
COPY image-files/ /

RUN chmod 711  /usr/local/bin/*

WORKDIR /app