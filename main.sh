#!/bin/bash
# 显示部署信息 机器ip 目录

echo "请输入要部署的机器ip"
read host_ip
echo "请输入你的机器主机名"
read hostname
echo "请输入zabbix-server的ip"
read server_ip
echo "请输入要部署的机器的root密码"
read -s host_password


        cat >> zabbix_agentd.conf <<EOF
PidFile=/usr/local/zabbix-agent/tmp/zabbix_agentd.pid
LogFile=/usr/local/zabbix-agent/tmp/zabbix_agentd.log
Server=$server_ip
ListenPort=10050
ServerActive=$server_ip
Hostname=$hostname
EOF
yum install sshpass
ssh-keyscan $host_ip > ~/.ssh/known_hosts
sshpass -p $host_password scp zabbix_agentd.conf root@$host_ip:/usr/local/
sshpass -p $host_password scp zabbix-agent.tar root@$host_ip:/usr/local/
sshpass -p $host_password scp deploy.sh root@$host_ip:/usr/local/
sshpass -p $host_password ssh root@$host_ip 'bash /usr/local/deploy.sh'

echo "zabbix-agent 4.0部署完成"

