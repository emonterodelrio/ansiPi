DEFAULT_USER=pi
DEFAULT_PASS=raspberry
NAME=meteopi

if [ $(id -u) = 0 ]; then
   printf "\033[1;31m\n\nMust be run as normal user:\n$0 192.168.1.39\033[0m\n"
   exit 1
fi

if ! sudo echo "Testing sudo"; then
   printf "\033[1;31m\n\nUser must have sudo su no password access:\nsudo visudo -> username ALL=(ALL) NOPASSWD: ALL\033[0m\n"
   exit 1
fi

if [ $# -ne 1 ];then
  printf "\033[1;31m\n\n You have to pass RaspberryPi current ip, like:\nsudo $0 192.1681.39\033[0m\n"
  exit 1
else
  IP=$1
fi
printf "\033[1;31m\n\nBefore use this script you must enable ssh at raspberry pi\033[0m\n"

sudo apt-get update -y 
sudo apt-get install -y software-properties-common

sudo apt-add-repository --yes --update ppa:ansible/ansiblev
sudo apt-get install -y ansible

printf "\033[1;32m\n\nSet ansible host ${IP}\033[0m\n"
sudo mkdir -p /etc/ansible/

#If not exists insert it
grep -q "meteopi" /etc/ansible/hosts || cat >>/etc/ansible/hosts <<EOL
[${NAME}]
${IP} ansible_user=${DEFAULT_USER} ansible_ssh_pass=${DEFAULT_PASS}
EOL

printf "\033[1;32m\n\nDisable host key check\033[0m\n"
sudo sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg
sudo ssh-keygen -f "/root/.ssh/known_hosts" -R ${IP} || true
ssh-keygen -f "/home/$(whoami)/.ssh/known_hosts" -R ${IP} || true

printf "\033[1;32m\n\nTest conection to raspberry\033[0m\n"

#Use default raspibian password
until ansible ${NAME} -m ping --extra-vars "ansible_user=${DEFAULT_USER} ansible_password=${DEFAULT_PASS} host_key_checking=False"; do
  echo "Wait for raspberry connection"
  sleep 3
done

printf "\033[1;32m\n\nNow going to exec this\033[0m\n"
printf "\033[1;32m\n\nansible-playbook 01-setCredentials.yaml\033[0m\n"
if ansible-playbook 02-meteopi.yaml; then
    echo "Done!"
else
  printf "\033[1;31m\n\nFail!, maybe your aren't logged in lastpass?\033[0m\n"
  printf "\033[1;32m\n\nType this once you have been loged:\nansible-playbook 02-meteopi.yaml --start-at-task=\"Lastpass - Ensure user loged in\"\033[0m\n"
  printf "\033[1;32m\n\nor this if you are already logged :p\nansible-playbook 02-meteopi.yaml --start-at-task=\"security : Install software via apt\"\033[0m\n"
exit 1;
fi

printf "\033[1;32m\n\nThat's all\033[0m\n"