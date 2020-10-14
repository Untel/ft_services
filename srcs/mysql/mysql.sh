echo "Reinstalling files"
mkdir /run/mysqld
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

echo "RUNNING MYSQL!"
# tail -f /dev/null
mysqld