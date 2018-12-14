DEFAULT_USER=pi
DEFAULT_PASS=raspberry

if ! [ $(id -u) = 0 ]; then
   printf "\033[1;31m\n\nMust be run as:\nsudo ./install.sh 192.168.1.39\033[0m\n"
   exit 1
fi

if [ $# -ne 1 ];then
  printf "\033[1;31m\n\n You have to pass RaspberryPi Ip , like:\nsudo ./install.sh 192.1681.39\033[0m\n"
  exit 1
else
  IP=$1
fi

printf "\033[1;31m\n\nBefore use this script you must enable ssh at raspberry pi\033[0m\n"

apt-get update -y 
apt-get install -y software-properties-common

apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible

printf "\033[1;32m\n\nSet ansible host ${IP}\033[0m\n"
mkdir -p /etc/ansible/
cat >>/etc/ansible/hosts <<EOL
[meteopi]
${IP} ansible_user=${DEFAULT_USER} ansible_ssh_pass=${DEFAULT_PASS}
EOL

printf "\033[1;32m\n\nDisable host key check\033[0m\n"
sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg

ssh-keygen -f "~/.ssh/known_hosts" -R ${IP} || true

printf "\033[1;32m\n\nTest conection to raspberry\033[0m\n"

#Use default raspibian password
until ansible raspi -m ping --extra-vars "ansible_user=${DEFAULT_USER} ansible_password=${DEFAULT_PASS} host_key_checking=False"; do
  echo "Wait for raspberry connection"
  sleep 3
done

printf "\033[1;32m\n\nNow exec this\033[0m\n"
printf "\033[1;32m\n\nansible-playbook 01-setCredentials.yaml\033[0m\n"
printf "\033[1;32m\n\nansible-playbook 02-secure.yaml\033[0m\n"
printf "\033[1;32m\n\nansible-playbook 03-installDashboard.yaml\033[0m\n"


