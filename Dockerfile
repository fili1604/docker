# soft a descargar
FROM php:7-apache

#Comando RUN ejecuta estos comandos y los hace permanentes en los contenedores? 
RUN apt-get update -y && apt-get install -y \
	&& libfreetype6-dev \
	&& libjpeg62-turbo-dev \
	&& libmcrypt-dev \
	&& libpng12-dev 

#soft necesario para que el soft funcione con docker
#RUN docker-php-ext-install -j$(nproc) iconv mcrypt && \
#    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir-/usr/include/ && \
#    docker-php-ext-install -j$(nproc) gd

#instala php
#RUN docker-php-ext-install pdo_mysql


#RUN pecl install redis-3.1.1 \
#    && docker-php-ext-enable redis

# COPY copia de la maquina anfitrion a la imagen que va ser creada
# complentar el phi.ini con la info necesaria, el .ini esta -> ../docker_curso/php.ini
COPY php.ini /usr/local/etc/php 
COPY index.php /var/www/html
# COMPOSER
#RUN apt-get install -y wget zip unzip

# copiamos el fichero composer-install.sh a la ruta /tmp
#COPY composer-install.sh /tmp
#RUN /tmp/composer-install.sh

# Puerto
EXPOSE 80

WORKDIR /var/www/html
