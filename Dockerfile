FROM php:7-cli

#install any requirements
RUN apt-get update && apt-get install -y git wget zip unzip libzip-dev vim
RUN  /usr/local/bin/docker-php-ext-install zip

# First get and install the composer package manager
COPY ./lib/composer.phar /bin/composer
RUN chmod +x /bin/composer
RUN composer self-update

#make daux available in the PATH variable
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# get the daux package to generate docs
RUN composer global require daux/daux.io
RUN mkdir -p /build/dist 

COPY ./lib/build.sh /build.sh
ENTRYPOINT  [ "/bin/bash", "/build.sh" ]