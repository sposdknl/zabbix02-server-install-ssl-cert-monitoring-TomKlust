set -euo pipefail

apt-get install -y zabbix-agent2

cp /vagrant/configs/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf
sed -i "s/^Server=127.0.0.1/Server=192.168.56.10/" /etc/zabbix/zabbix_agent2.conf
sed -i "s/^ServerActive=127.0.0.1/ServerActive=192.168.56.10/" /etc/zabbix/zabbix_agent2.conf

systemctl enable --now zabbix-agent2
