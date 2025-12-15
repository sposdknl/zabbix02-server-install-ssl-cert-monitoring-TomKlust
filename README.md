# Instalace Zabbix 7.0 LTS pomocí Vagrant

## Popis
Automatizovaná instalace Zabbix 7.0 LTS (server + frontend + agent2) na Debian 12 pomocí Vagrant a shell provisioning skriptů.

## Struktura repozitáře
- `Vagrantfile` – definice VM
- `provisioning/` – skripty provádějící instalaci
- `configs/` – konfigurační soubory (šablony)
- `imports/sposdk.cz_hosts.yaml` – import hostů
- `Images/` – snímky obrazovky

## Spuštění
1. Naklonuj repo:
   ```bash
   git clone <your-repo-url>
   cd zabbix02

2. Spusť VM:
   vagrant up

3. Po skončení provisioning bude Zabbix frontend dostupný na http://localhost:8080/zabbix/ nebo http://localhost:8080/ (záleží na apache conf).

4. Ověření funkčnosti:
   vagrant ssh -c "systemctl status zabbix-server zabbix-agent2 mariadb apache2"


