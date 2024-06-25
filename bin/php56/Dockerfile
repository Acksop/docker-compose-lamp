FROM php:5.6-apache

RUN apt-get -y update && apt-get upgrade -y

# Install tools && libraries
RUN apt-get -y install --fix-missing apt-utils nano wget dialog \
    build-essential git curl libcurl3 libcurl3-dev zip \
    libmcrypt-dev libsqlite3-dev libsqlite3-0 mysql-client \
    zlib1g-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# PHP5 Extensions

#php-amqp - AMQP extension for PHP
#php-apcu - APC User Cache for PHP
#php-geoip - GeoIP module for PHP
#php-igbinary - igbinary PHP serializer
#php-imagick - Provides a wrapper to the ImageMagick library
#php-mongodb - MongoDB driver for PHP
#php-msgpack - PHP extension for interfacing with MessagePack
#php-oauth - OAuth 1.0 consumer and provider extension
#php-redis - PHP extension for interfacing with Redis
#php-rrd - PHP bindings to rrd tool system
#php-smbclient - PHP wrapper for libsmbclient
#php-solr - PHP extension for communicating with Apache Solr server
#php-ssh2 - Bindings for the libssh2 library
#php-uuid - PHP UUID extension
#php-yac - YAC (Yet Another Cache) for PHP
#php-zmq - ZeroMQ messaging bindings for PHP
#php-radius - radius client library for PHP
#php-http - PECL HTTP module for PHP Extended HTTP Support
#php-uploadprogress - file upload progress tracking extension for PHP
#libapache2-mod-php5.6 - server-side, HTML-embedded scripting language (Apache 2 module)
#php5.6-cgi - server-side, HTML-embedded scripting language (CGI binary)
#php5.6-cli - command-line interpreter for the PHP scripting language
#php5.6-phpdbg - server-side, HTML-embedded scripting language (PHPDBG binary)
#php5.6-fpm - server-side, HTML-embedded scripting language (FPM-CGI binary)
#libphp5.6-embed - HTML-embedded scripting language (Embedded SAPI library)
#php5.6-dev - Files for PHP5.6 module development
#php5.6-common - documentation, examples and common module for PHP
#php5.6 - server-side, HTML-embedded scripting language (metapackage)
#php5.6-curl - CURL module for PHP
#php5.6-gd - GD module for PHP
#php5.6-imap - IMAP module for PHP
#php5.6-intl - Internationalisation module for PHP
#php5.6-ldap - LDAP module for PHP
#php5.6-mysql - MySQL module for PHP
#php5.6-pgsql - PostgreSQL module for PHP
#php5.6-pspell - pspell module for PHP
#php5.6-recode - recode module for PHP
#php5.6-snmp - SNMP module for PHP
#php5.6-sqlite3 - SQLite3 module for PHP
#php5.6-sybase - Sybase module for PHP
#php5.6-tidy - tidy module for PHP
#php5.6-opcache - Zend OpCache module for PHP
#php-xdebug - Xdebug Module for PHP
#php5.6-json - JSON module for PHP
#php-memcached - memcached extension module for PHP, uses libmemcached
#php5.6-bz2 - bzip2 module for PHP
#php5.6-mcrypt - libmcrypt module for PHP
#php5.6-odbc - ODBC module for PHP
#php5.6-readline - readline module for PHP
#php5.6-interbase - Interbase module for PHP
#php5.6-xmlrpc - XMLRPC-EPI module for PHP
#php5.6-enchant - Enchant module for PHP
#php5.6-gmp - GMP module for PHP
#php5.6-xsl - XSL module for PHP (dummy)
#php-memcache - memcache extension module for PHP
#php-gmagick - Provides a wrapper to the GraphicsMagick library
#php5.6-bcmath - Bcmath module for PHP
#php5.6-mbstring - MBSTRING module for PHP
#php5.6-soap - SOAP module for PHP
#php5.6-xml - DOM, SimpleXML, WDDX, XML, and XSL module for PHP
#php5.6-zip - Zip module for PHP
#php-tideways - Tideways PHP Profiler Extension
#php-mailparse - Email message manipulation for PHP
#php-propro - propro module for PHP
#php-raphf - raphf module for PHP
#php-stomp - Streaming Text Oriented Messaging Protocol (STOMP) client module for PHP
#php-gearman - PHP wrapper to libgearman
#php-xcache - fast, stable PHP opcode cacher
#php-mongo - MongoDB database driver
#php5.6-dba - DBA module for PHP
#php-xhprof - Hierarchical Profiler for PHP 5.x


RUN docker-php-ext-install curl \
    && docker-php-ext-install tokenizer \
    && docker-php-ext-install json \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_sqlite \
    && docker-php-ext-install mysql \
	&& docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini

# Enable apache modules
RUN a2enmod rewrite headers

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]