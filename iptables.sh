#!/bin/sh

# delete all rules
iptables -F
# show rules
iptables -L

# all ssh
iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
iptables -I INPUT -s 192.168.152.10 -p tcp -m tcp --dport 20880 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 20884 -j ACCEPT

iptables -D INPUT 1

iptables-save > /etc/iptables.rules
iptables-restore /etc/iptables.rules