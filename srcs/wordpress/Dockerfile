FROM debian:buster

RUN apt-get update && \
    apt-get -y install php7.3 php-fpm wget curl php-mysql mariadb-client
RUN mkdir -p /var/www
RUN wget https://wordpress.org/latest.tar.gz  && \
    tar -xvf latest.tar.gz && mv /wordpress/* /var/www && \
    chown -R www-data:www-data /var/www && \
    rm -r /wordpress/ latest.tar.gz

RUN mkdir -p /run/php/
COPY ./www.conf /etc/php/7.3/fpm/pool.d/
COPY ./wp-config.php /var/www/
COPY ./entry.sh /tmp/

RUN chmod +x /tmp/entry.sh
ENTRYPOINT [ "sh", "/tmp/entry.sh" ]

EXPOSE 9000