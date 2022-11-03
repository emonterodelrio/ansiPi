#!/bin/bash
if [ $(id -u) = 0 ]; then
  printf "\033[1;31m\n\nMust be run as normal user"
  exit 1
fi

if ! sudo printf "\033[1;32mTesting sudo\033[0m\n"; then
  printf "\033[1;31m\n\nUser must have sudo su no password access:\nsudo visudo -> username ALL=(ALL) NOPASSWD: ALL\033[0m\n"
  exit 1
fi

if [ $# -ne 1 ] && [ $# -ne 3 ] && [ $# -ne 4 ]; then
  printf "\033[1;31m\n\n Usage: \nsudo $0 192.168.1.39\nsudo $0 192.168.1.39 [current_user current_password]\nsudo $0 192.168.1.39 [current_user current_password deploy_type]\033[0m\n"
  exit 1
else
  IP=$1
fi

if [ $# -eq 1 ]; then
  DEFAULT_USER=pi
  DEFAULT_PASS=raspberry
fi

if [ $# -eq 3 ]; then
  DEFAULT_USER=$2
  DEFAULT_PASS=$3
fi

if [ $# -eq 4 ]; then
  DEFAULT_USER=$2
  DEFAULT_PASS=$3
  DEPLOY_TYPE=$4
fi


if [ -z "$DEPLOY_TYPE" ]; then
  SELECTION_OK=false
  while ! $SELECTION_OK; do
    printf "\033[1;32mChoose one [meteopi|veopi]:\033[0m\n"
    read DEPLOY_TYPE
    case $DEPLOY_TYPE in
      meteopi)
        SELECTION_OK=true
        ;;

      veopi)
        SELECTION_OK=true
        ;;

      *)
        printf "\033[1;31m$DEPLOY_TYPE is not at list\033[0m\n"
        ;;
    esac
  done
else
  if [[ $DEPLOY_TYPE != "meteopi" ]] && [[ $DEPLOY_TYPE != "veopi" ]]; then
    printf "\033[1;31m\n\n Wrong deploy_type, possibles are: meteopi, veopi\033[0m\n"
    exit 1
  fi
fi

printf "\033[1;32mInstall or update software\033[0m\n"
sudo apt-get update -y
sudo apt-get install -y software-properties-common

sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible sshpass


export REPOPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export ANSIBLE_CONFIG=$REPOPATH/conf/ansible.cfg
export INVENTORY_PATH=$REPOPATH/conf/inventory/
export ROLES_PATH=$REPOPATH/roles/

case $DEPLOY_TYPE in
  meteopi)
    printf "\033[1;32m\n\nSet ansible host $IP\033[0m\n"
    sudo sed -i "s/192.*/$IP ansible_user=$DEFAULT_USER ansible_ssh_pass=$DEFAULT_PASS/g" conf/inventory/meteopi
    ;;

  veopi)

    printf "\033[1;32m\n\nSet ansible host $IP\033[0m\n"
    sudo sed -i "s/192.*/$IP ansible_user=$DEFAULT_USER ansible_ssh_pass=$DEFAULT_PASS/g" conf/inventory/veopi
    ;;
esac

ssh-keygen -f "/home/$(whoami)/.ssh/known_hosts" -R ${IP} || true

printf "\033[1;32m\n\nTest connection to raspberry\033[0m\n"

echo "ansible $DEPLOY_TYPE -m ping --extra-vars ansible_user=${DEFAULT_USER} ansible_password=${DEFAULT_PASS} host_key_checking=False"


#Use default raspibian password
RETRIES=3
until export ANSIBLE_CONFIG=$REPOPATH/conf/ansible.cfg && ansible $DEPLOY_TYPE -m ping --extra-vars "ansible_user=${DEFAULT_USER} ansible_password=${DEFAULT_PASS} host_key_checking=False"; do
  RETRIES=$((RETRIES-1))
  if [ "$RETRIES" -eq 0 ]; then
    echo
    printf "\033[1;31m¿Maybe you have to change password at conf/inventory/$DEPLOY_TYPE? $0 IP current_user current_password [deploy_type]\033[0m\n"
    exit 1;
  fi
  printf "\033[1;32m\n\nWaiting for raspberry pi connection\033[0m\n"
  sleep 1
done

case $DEPLOY_TYPE in
  meteopi)
    ansible-playbook playbooks/021-meteopi.yaml -vv

    echo "Reboot"
    sleep 5
    CHECK_IP=$(cat conf/inventory/$DEPLOY_TYPE | grep ansible | cut -d" " -f1)
    while ! nc -zv $CHECK_IP 22 &> /dev/null; do
      printf "\033[1;32m\n\nWaiting for host to reboot at $CHECK_IP\033[0m\n"
      sleep 1;
    done

    ansible-playbook playbooks/022-meteopi.yaml -vv
    ;;

  veopi)
    ansible-playbook playbooks/021-veopi.yaml -vv

    echo "Reboot"
    sleep 5
    CHECK_IP=$(cat conf/inventory/$DEPLOY_TYPE | grep ansible | cut -d" " -f1)
    while ! nc -zv $CHECK_IP 22 &> /dev/null; do
      printf "\033[1;32m\n\nWaiting for host to reboot at $CHECK_IP\033[0m\n"
      sleep 1;
    done

    ansible-playbook playbooks/022-veopi.yaml -vv
    ;;

  *)
    echo "Wrong $DEPLOY_TYPE option"
  ;;  
esac



printf "\033[1;32m\n\nDone\033[0m\n"