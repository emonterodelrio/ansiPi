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
  printf "\033[1;31m\n\n You have to pass RaspberryPi current ip, like:\nsudo $0 192.168.1.39\033[0m\n"
  exit 1
else
  IP=$1
fi

printf "\033[1;31m\n\nBefore use this script you must enable ssh at raspberry pi\033[0m\n"

sudo apt-get update -y 
sudo apt-get install -y software-properties-common

sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible sshpass lastpass-cli


printf "\033[1;32m\n\nSet ansible host $IP\033[0m\n"

sudo sed -i "s/192.168.1.11 .*/$IP ansible_user=$DEFAULT_USER ansible_ssh_pass=$DEFAULT_PASS/g" conf/inventory

printf "\033[1;32m\n\nSet ansible alias\033[0m\n"

if grep -q ansipi ~/.bashrc; then
  echo "Sed aliases at ~/.bashrc file"
  sed -i "s#alias ansipi=(.*)#alias ansipi=\"export ANSIBLE_CONFIG=$(pwd)/conf/ansible.cfg && ansible-playbook -i $(pwd)/conf/inventory\"#g" ~/.bashrc
else
  echo "Append aliases to ~/.bashrc file"
  echo "alias ansipi=\"export ANSIBLE_CONFIG=$(pwd)/conf/ansible.cfg && ansible-playbook -i $(pwd)/conf/inventory\"" >> ~/.bashrc
fi

CURRENT=`pwd`
. ~/.bashrc
cd $CURRENT

#export ANSIBLE_CONFIG=$(pwd)/conf/ansible.cfg
#alias ansipi="export ANSIBLE_CONFIG=$(pwd)/conf/ansible.cfg && ansible-playbook -i $(pwd)/conf/inventory"

printf "\033[1;32m\n\nDisable host key check\033[0m\n"
sudo sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg
sudo ssh-keygen -f "/root/.ssh/known_hosts" -R ${IP} || true
ssh-keygen -f "/home/$(whoami)/.ssh/known_hosts" -R ${IP} || true

printf "\033[1;32m\n\nTest connection to raspberry\033[0m\n"

#Use default raspibian password
until ansible meteopi -m ping -i `pwd`/conf/inventory --extra-vars "ansible_user=${DEFAULT_USER} ansible_password=${DEFAULT_PASS} host_key_checking=False"; do
  echo "Wait for raspberry connection"
  sleep 3
done

if export ANSIBLE_CONFIG=$(pwd)/conf/ansible.cfg && ansible-playbook -i $(pwd)/conf/inventory 02-meteopi.yaml; then
    echo "Done!"
else
  printf "\033[1;31m\n\nFail!, maybe your aren't logged in lastpass?\033[0m\n"
  printf "\033[1;32m\n\nType this once you have been loged:\nansipi 02-meteopi.yaml --start-at-task=\"Lastpass - Ensure user loged in\"\033[0m\n"
  printf "\033[1;32m\n\nor this if you are already logged :p\nansipi 02-meteopi.yaml --start-at-task=\"security : Install software via apt\"\033[0m\n"
exit 1;
fi

printf "\033[1;32m\n\nThat's all\033[0m\n"
