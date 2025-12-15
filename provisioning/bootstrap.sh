set -euo pipefail
export DEBIAN_FRONTEND=noninteractive
LOG=/var/log/provision_zabbix.log
exec > >(tee -a "$LOG") 2>&1

echo "[+] Running bootstrap provisioning"

apt-get update -y
apt-get upgrade -y

apt-get install -y gnupg2 wget curl lsb-release ca-certificates apt-transport-https software-properties-common

bash /vagrant/provisioning/install_db.sh
bash /vagrant/provisioning/install_zabbix.sh
bash /vagrant/provisioning/apache_conf.sh
bash /vagrant/provisioning/install_agent2.sh

echo "[+] Provisioning completed"
