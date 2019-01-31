DEFAULT_USER=pi
DEFAULT_PASS=k9fsxH1uNRNJcR97UBvy5Lc9NMehtol5K6M6Sv0URr8fzgu6hR
NAME=calderapi

if [ $(id -u) != 0 ]; then
   printf "\033[1;31m\n\nMust be run as root user:\n\nFirst, become root:\nsudo su;\nThen type:\n $0 192.168.1.39\033[0m\n"
   exit 1
fi

if [ $# -ne 1 ];then
  printf "\033[1;31m\n\n You have to pass RaspberryPi current ip, like:\n$0 192.1681.39\033[0m\n"
  exit 1
else
  IP=$1
fi
printf "\033[1;31m\n\nBefore use this script you must enable ssh at raspberry pi\033[0m\n"

apt-get update -y 
apt-get install -y software-properties-common

apt-add-repository --yes --update ppa:ansible/ansiblev
apt-get install -y ansible

printf "\033[1;32m\n\nSet ansible host ${IP}\033[0m\n"
mkdir -p /etc/ansible/

#If not exists insert it
if [ -z "$(cat /etc/ansible/hosts | grep calderapi | head -n +1)" ]; then
cat >>/etc/ansible/hosts <<EOL
[${NAME}]
${IP} ansible_user=${DEFAULT_USER} ansible_ssh_pass=${DEFAULT_PASS}
EOL
fi

printf "\033[1;32m\n\nDisable host key check\033[0m\n"
sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg
ssh-keygen -f "/root/.ssh/known_hosts" -R ${IP}  &> /dev/null || true 
ssh-keygen -f "/home/$(whoami)/.ssh/known_hosts" -R ${IP}  &> /dev/null || true

printf "\033[1;32m\n\nTest conection to raspberry\033[0m\n"

#Use default raspibian password
until ansible ${NAME} -vvvv -m ping --extra-vars "ansible_user=${DEFAULT_USER} ansible_password=${DEFAULT_PASS} host_key_checking=False"; do
  echo "Wait for raspberry connection"
  sleep 3
done

printf "\033[1;32m\n\nNow going to exec this\033[0m\n"
printf "\033[1;32m\n\nansible-playbook 01-setCredentials.yaml\033[0m\n"

#If ip declared then use it instead arguments
if [ -n "$(cat /etc/ansible/hosts | grep -A1 $NAME | tail -n1)" ]; then
  IP=$(cat /etc/ansible/hosts | grep -A1 calderapi | tail -n1 | cut -d" " -f1);
fi

if ! ansible-playbook -vvvv 02-calderapi.yaml --extra-vars "ip_from_install=$IP"; then
  printf "\033[1;31m\n\nFail!, maybe your aren't logged in lastpass?\033[0m\n"
  printf "\033[1;32m\n\nType this once you have been loged:\nansible-playbook 02-calderapi.yaml --start-at-task=\"Lastpass - Ensure user loged in\"\033[0m\n"
  printf "\033[1;32m\n\nor this if you are already logged :p\nansible-playbook 02-calderapi.yaml --start-at-task=\"dht22 : Install software via apt\"\033[0m\n"
  exit 1;
fi

printf "\033[1;32m\n\nThat's all\033[0m\n"
