FROM debian:buster

EXPOSE 443

RUN apt-get update && \
	apt-get install openssl nginx -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /nginx.key -out /nginx.crt -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=jihkang"

RUN chmod 777 /nginx.key
RUN chmod 777 /nginx.crt

COPY ./conf/default	/etc/nginx/sites-available/

ENTRYPOINT ["nginx", "-g", "daemon off;"]