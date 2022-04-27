#!/bin/bash
  DEFAULT_USER=pi
  DEFAULT_PASS=raspberry

if [ $(id -u) = 0 ]; then
   printf "\033[1;31m\n\nMust be run as normal user:\n$0 192.168.1.39\033[0m\n"
   exit 1
fi

if ! sudo echo "Testing sudo"; then
   printf "\033[1;31m\n\nUser must have sudo su no password access:\nsudo visudo -> username ALL=(ALL) NOPASSWD: ALL\033[0m\n"
   exit 1
fi

if [ $# -ne 1 ];then
  printf "\033[1;31m\n\n You have to pass RaspberryPi current ip , user and password, like:\nsudo $0 192.168.1.39\033[0m\n"
  exit 1
else
  IP=$1
fi

printf "\033[1;31m\n\nBefore use this script you must enable ssh at raspberry pi\033[0m\n"

sudo apt-get update -y 
sudo apt-get install -y software-properties-common

sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible sshpass

printf "\033[1;32m\n\nSet ansible host $IP\033[0m\n"

sudo sed -i "s/192.168.1.11 .*/$IP ansible_user=$DEFAULT_USER ansible_ssh_pass=$DEFAULT_PASS/g" conf/inventory/inventory

export REPOPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export ANSIBLE_CONFIG=$REPOPATH/conf/ansible.cfg
export INVENTORY_PATH=$REPOPATH/conf/inventory/

# printf "\033[1;32m\n\nDisable host key check\033[0m\n"
# sudo sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg
# sudo ssh-keygen -f "/root/.ssh/known_hosts" -R ${IP} || true
# ssh-keygen -f "/home/$(whoami)/.ssh/known_hosts" -R ${IP} || true

printf "\033[1;32m\n\nTest connection to raspberry\033[0m\n"

#Use default raspibian password
until export ANSIBLE_CONFIG=$REPOPATH/conf/ansible.cfg && ansible meteopi -m ping --extra-vars "ansible_user=${DEFAULT_USER} ansible_password=${DEFAULT_PASS} host_key_checking=False"; do
  echo "Wait for raspberry connection"
  sleep 3
done

ansible-playbook 021-meteopi.yaml

while ! nc -zv 192.168.1.11 22 &> /dev/null; do
  echo "Waiting for host to reboot";
  sleep 1;
done

ansible-playbook 022-meteopi.yaml -vv

printf "\033[1;32m\n\nThat's all\033[0m\n"
