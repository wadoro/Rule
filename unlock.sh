#!/bin/bash

if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    yum install -y https://github.com/wadoro/Rule/raw/master/epel-release-latest-7.noarch.rpm
    yum install bind-utils
    yum install -y dnsmasq
elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
else
    echo "This script only supports CentOS, Ubuntu and Debian."
    exit 1
fi

if [ $? -eq 0 ]; then
    systemctl enable dnsmasq
    rm -f /etc/resolv.conf
    echo "nameserver 127.0.0.1" > /etc/resolv.conf
    touch /etc/dnsmasq.d/unlock.conf
    echo "server=8.8.8.8" > /etc/dnsmasq.d/unlock.conf
    echo "server=8.8.4.4" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflix.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflix.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/nflximg.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/nflximg.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/nflxvideo.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/nflxso.net/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/nflxext.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest0.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest1.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest2.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest3.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest4.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest5.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest6.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest7.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest8.com/$1" >> /etc/dnsmasq.d/unlock.conf
    echo "address=/netflixdnstest9.com/$1" >> /etc/dnsmasq.d/unlock.conf
    
    systemctl restart dnsmasq
    echo "dnsmasq启动成功"
else
    echo "dnsmasq安装失败, 请检查仓库状况"
fi
