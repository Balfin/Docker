FROM php:5.6-fpm
RUN apt-get update \
   && docker-php-ext-install pdo_mysql \
   && apt-get install -y libxml2-dev \
       && docker-php-ext-install soap \
   && apt-get install -y libmcrypt4 libmcrypt-dev \
       && docker-php-ext-install mcrypt \
   && apt-get install -y libxslt-dev \
       && docker-php-ext-install xsl \
   && apt-get install -y libicu-dev \
       && docker-php-ext-install intl \
   && apt-get install -y libpng-dev libjpeg-dev \
       && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib \
       && docker-php-ext-install gd \
   && apt-get install -y zlib1g-dev

RUN apt-get install -y \
        libmcrypt-dev \
        libcurl4-nss-dev \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-install curl 




RUN apt-get update \
	&& apt-get install -y \
		openssl \
		git
RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail
RUN echo 'sendmail_path = /usr/bin/mhsendmail --smtp-addr mailhog:1025' > /usr/local/etc/php/conf.d/php.ini
RUN echo 'cgi.fix_pathinfo = 1' > /usr/local/etc/php/conf.d/php.ini
RUN ["apt-get", "install", "-y", "vim"]
RUN yes | pecl install xdebug-2.5.5 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini



# Install oAuth
ADD custom.ini /usr/local/etc/php/conf.d/custom.ini

COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./changeip.sh /var/www/html/changeip.sh




