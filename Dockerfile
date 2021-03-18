FROM php:7-cli

#install any requirements
RUN apt-get update && \
	apt-get install -y git wget zip unzip libzip-dev vim && \
	rm -rf /var/lib/apt/lists/*
	
RUN /usr/local/bin/docker-php-ext-install zip

# First get and install the composer package manager
COPY --chmod=+x ./lib/composer.phar /bin/composer

#make daux available in the PATH variable
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# get the daux package to generate docs
RUN composer global require daux/daux.io
RUN mkdir -p /build/dist 

COPY --chmod=+x ./lib/build.sh /build.sh
ENTRYPOINT  [ "/build.sh" ]