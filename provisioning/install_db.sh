set -euo pipefail

# Install MariaDB and create zabbix DB/user
apt-get install -y mariadb-server mariadb-client

MYSQL_ROOT_AUTH=""

sleep 3

DB_ROOT_CMD="mysql -u root"
$DB_ROOT_CMD <<SQL || true
CREATE DATABASE IF NOT EXISTS zabbix CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER IF NOT EXISTS 'zabbix'@'localhost' IDENTIFIED BY 'zabbix_pass';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';
FLUSH PRIVILEGES;
SQL

systemctl enable --now mariadb
