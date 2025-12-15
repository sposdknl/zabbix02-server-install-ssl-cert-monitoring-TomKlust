set -euo pipefail

DIST="$(lsb_release -sc)"
ZBX_VERSION="7.0"
wget -qO /tmp/zabbix-release.deb "https://repo.zabbix.com/zabbix/${ZBX_VERSION}/debian/pool/main/z/zabbix-release/zabbix-release_${ZBX_VERSION}-1+debian${DIST}_all.deb" || true

if [ -f /tmp/zabbix-release.deb ]; then
  dpkg -i /tmp/zabbix-release.deb || true
  apt-get update
else
  echo "Could not download repo package; adding repo manually"
fi

apt-get install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts

zcat /usr/share/zabbix-sql-scripts/mysql/create.sql.gz | mysql -u zabbix -pzabbix_pass zabbix

cp /vagrant/configs/zabbix_server.conf /etc/zabbix/zabbix_server.conf
chown root:root /etc/zabbix/zabbix_server.conf
chmod 640 /etc/zabbix/zabbix_server.conf

systemctl enable --now zabbix-server zabbix-server.service apache2
