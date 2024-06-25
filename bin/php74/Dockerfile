FROM php:7.4.2-apache-buster

# Surpresses debconf complaints of trying to install apt packages interactively
# https://github.com/moby/moby/issues/4032#issuecomment-192327844
 
ARG DEBIAN_FRONTEND=noninteractive

#Clear APT Cache
RUN apt-get clean
RUN mv /var/lib/apt/lists /tmp
RUN mkdir -p /var/lib/apt/lists/partial
RUN apt-get clean

# Update
RUN apt-get -y update --fix-missing && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends install -y apt-utils net-tools && \
    rm -rf /var/lib/apt/lists/*

# Install useful tools and install important libaries
RUN apt-get -y update

RUN apt-get -y --no-install-recommends install nano wget \
		dialog \
		libsqlite3-dev \
		libsqlite3-0

RUN apt-get -y --no-install-recommends install default-mysql-client \
		zlib1g-dev \
		libzip-dev \
		libicu-dev

RUN apt-get -y --no-install-recommends install --fix-missing apt-utils \
		build-essential \
		git \
		curl \
		libonig-dev

RUN apt-get -y --no-install-recommends install --fix-missing libcurl4 \
		libcurl4-openssl-dev \
		zip \
		openssl
    
	
# Install xdebug
RUN pecl install xdebug-2.8.0 && \
    docker-php-ext-enable xdebug

# Install redis
RUN pecl install redis-5.1.1 && \
    docker-php-ext-enable redis

# Install imagick
RUN apt-get update && \
    apt-get -y --no-install-recommends install --fix-missing libmagickwand-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pecl install imagick && \
    docker-php-ext-enable imagick

#Install NodeJs

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get -y install nodejs

#Install Tools for screenshot
RUN apt-get -y install cutycapt xvfb

#Install Composer
RUN wget -O composer-setup.php https://getcomposer.org/installer
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer



# Other PHP7 Extensions

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libldb-dev
RUN apt-get install -y libldap2-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y postgresql-client
#RUN apt-get install -y mysql-client 
RUN apt-get install -y mariadb-client 
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libsqlite3-0
RUN apt-get install -y libc-client-dev
RUN apt-get install -y libkrb5-dev
RUN apt-get install -y curl
RUN apt-get install -y libcurl4
#RUN apt-get install -y libcurl4-dev
RUN apt-get install -y firebird-dev
RUN apt-get install -y libpspell-dev
RUN apt-get install -y aspell-en
RUN apt-get install -y aspell-de  
RUN apt-get install -y libtidy-dev
RUN apt-get install -y libsnmp-dev
RUN apt-get install -y librecode0
RUN apt-get install -y librecode-dev
#RUN pecl install apc
RUN docker-php-ext-install opcache
RUN docker-php-ext-install ftp
RUN docker-php-ext-install xsl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install calendar
RUN docker-php-ext-install ctype
RUN docker-php-ext-install dba
RUN docker-php-ext-install dom
RUN docker-php-ext-install zip
RUN docker-php-ext-install session
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-install ldap
#RUN docker-php-ext-install json
#RUN docker-php-ext-install hash
RUN docker-php-ext-install sockets
RUN docker-php-ext-install pdo
RUN docker-php-ext-install -j$(nproc) intl
RUN docker-php-ext-install mbstring
#RUN docker-php-ext-install tokenizer
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-install intl
#RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install mysqli
#RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
#RUN docker-php-ext-install imap
RUN docker-php-ext-install curl
RUN docker-php-ext-install exif
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install gettext
#RUN apt install -y libgmp-dev # idk
#RUN docker-php-ext-install gmp # idk
RUN docker-php-ext-install iconv
#RUN docker-php-ext-install interbase
RUN docker-php-ext-install pdo_firebird
RUN docker-php-ext-install opcache
#RUN docker-php-ext-install oci8 # idk
#RUN docker-php-ext-install odbc # idk
RUN docker-php-ext-install pcntl
#RUN apt install -y freetds-dev # idk
#RUN docker-php-ext-install pdo_dblib  # idk
#RUN docker-php-ext-install pdo_oci # idk
#RUN docker-php-ext-install pdo_odbc # idk
RUN docker-php-ext-install phar
RUN docker-php-ext-install posix
RUN docker-php-ext-install pspell
#RUN apt install -y libreadline-dev # idk
#RUN docker-php-ext-install readline # idk
#RUN docker-php-ext-install recode
RUN docker-php-ext-install shmop
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install snmp
RUN docker-php-ext-install sysvmsg
RUN docker-php-ext-install sysvsem
RUN docker-php-ext-install sysvshm
RUN docker-php-ext-install tidy
#RUN docker-php-ext-install wddx
RUN docker-php-ext-install xml
#RUN apt install -y libxml2-dev # idk
#RUN docker-php-ext-install xmlreader # idk
#RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install xmlwriter             
# idk bz2 enchant 
RUN apt install -y libbz2-dev
RUN docker-php-ext-install bz2
#RUN docker-php-ext-install timezonedb

# Install Soap Extension
RUN docker-php-ext-install soap

# Install APCu and APC backward compatibility
#RUN apt-get install -y php-apc
RUN pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini
	
# Install Freetype 
RUN apt-get -y update && \
    apt-get --no-install-recommends install -y libfreetype6-dev \
libjpeg62-turbo-dev \
libpng-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd

# Enable apache modules
RUN a2enmod rewrite headers

# Cleanup
RUN rm -rf /usr/src/*
