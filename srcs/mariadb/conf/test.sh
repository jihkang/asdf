
echo "CREATE DATABASE IF NOT EXISTS ${WP};
FLUSH PRIVILEGES;
USE ${WP};
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${MY_PASSWD}';
GRANT ALL PRIVILEGES ON * TO '${DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MY_PASSWD}';
" > sql

mysql_install_db --user=root
mysqld -u root --bootstrap <sql
mysqld -u root
