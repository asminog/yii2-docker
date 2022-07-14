FROM php:7.4.29-fpm
MAINTAINER asminog <asminog@asminog.com>

ENV DEBIAN_FRONTEND=noninteractive \
    COMPOSER_ALLOW_SUPERUSER=1 \
    PHP_USER_ID=501 \
    PHP_ENVIRONMENT=prod \
    PHP_ENABLE_XDEBUG=0 \
    PATH=/app:/app/vendor/bin:/root/.composer/vendor/bin:$PATH \
    TERM=linux

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && IPE_DONT_ENABLE=1 install-php-extensions \
	#PHP 7.4
	amqp \
	apcu \
#	apcu_bc \
	ast \
	bcmath \
	blackfire \
	bz2 \
	calendar \
	cmark \
	csv \
	dba \
	decimal \
	ds \
	enchant \
	ev \
	event \
	excimer \
	exif \
	ffi \
	gd \
	gearman \
	geoip \
#	geos* \
	geospatial \
	gettext \
	gmagick \
	gmp \
	gnupg \
	grpc \
#	http \
	igbinary \
	imagick \
	imap \
	inotify \
	intl \
	ioncube_loader \
	jsmin \
	json_post \
	ldap \
	luasandbox \
	lzf \
	mailparse \
	maxminddb \
	mcrypt \
	memcache \
	memcached \
#	memprof* \
	mongodb \
	mosquitto \
	msgpack \
	mysqli \
	oauth \
	oci8 \
	odbc \
	opcache \
#	opencensus \
	openswoole \
#	parallel* \
#	parle* \
	pcntl \
	pcov \
	pdo_dblib \
	pdo_firebird \
	pdo_mysql \
	pdo_oci \
	pdo_odbc \
	pdo_pgsql \
#	pdo_sqlsrv* \
	pgsql \
	propro \
	protobuf \
	pspell \
	raphf \
	rdkafka \
	redis \
	seaslog \
	shmop \
	smbclient \
	snmp \
#	snuffleupagus \
	soap \
	sockets \
	solr \
	sourceguardian \
	spx \
#	sqlsrv* \
	ssh2 \
	stomp \
	swoole \
	sysvmsg \
	sysvsem \
	sysvshm \
#	tensor* \
	tidy \
	timezonedb \
	uopz \
	uploadprogress \
	uuid \
#	vips* \
	xdebug \
	xhprof \
	xlswriter \
	xmldiff \
	xmlrpc \
	xsl \
	yac \
	yaml \
	yar \
	zephir_parser \
	zip \
	zookeeper \
	zstd \
	@composer

# Add configuration files
COPY image-files/ /

# Install composer
RUN mv /usr/local/bin/composer /usr/local/bin/composer.phar && \
    chmod 711  /usr/local/bin/* && \
    # Install Yii framework bash autocompletion
    curl -L https://raw.githubusercontent.com/yiisoft/yii2/master/contrib/completion/bash/yii -o /etc/bash_completion.d/yii

WORKDIR /app