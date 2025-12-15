set -euo pipefail

apt-get install -y apache2 php php-mbstring php-gd php-xml php-bcmath php-zip php-mysqli libapache2-mod-php

PHP_INI="/etc/php/$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')/apache2/php.ini"
if [ -f "$PHP_INI" ]; then
  sed -i "s#;date.timezone =#date.timezone = Europe/Prague#g" $PHP_INI || true
fi

update $ZBX_SERVER_NAME)
cp /vagrant/configs/zabbix.conf.php /etc/zabbix/web/zabbix.conf.php || true

a2enmod php
systemctl restart apache2
