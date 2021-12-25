#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
systemctl stop snell
systemctl disable snell
rm -rf /usr/local/bin/snell-server
rm -rf /etc/systemd/system/snell.service
rm -rf /etc/snell/snell-server.conf
rm -rf /etc/snell
rm -rf /root/snell*
systemctl daemon-reload
echo -e "Snell \033[1;32m 卸载完成 \033[0m"
