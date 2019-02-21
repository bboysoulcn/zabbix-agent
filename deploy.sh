useradd zabbix 
cd /usr/local/ 
tar -xvf zabbix-agent.tar 
mkdir zabbix-agent/tmp 
mkdir zabbix-agent/log 
mv /usr/local/zabbix-agent/conf/zabbix_agentd.conf /usr/local/zabbix-agent/conf/zabbix_agentd.conf.bak
mv /usr/local/zabbix_agentd.conf /usr/local/zabbix-agent/conf/
chown -Rf zabbix:zabbix /usr/local/zabbix-agent/
/usr/local/zabbix-agent/sbin/zabbix_agentd -c /usr/local/zabbix-agent/conf/zabbix_agentd.conf