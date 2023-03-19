FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt-get upgrade \
  && apt-get install -y mariadb-client mariadb-server \
  && mkdir -p /var/run/mysqld && \
  chown mysql:mysql /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql
COPY ./conf/test.sh /

RUN chmod 777 test.sh



ENTRYPOINT ["sh", "test.sh"]
