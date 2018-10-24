printf "\033[1;31m\n\nBefore use this script you must enable ssh at raspberry pi\033[0m\n"
read -p

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

printf "\033[1;32m\n\nInstall ansible\033[0m\n"
cd ~
git clone git://github.com/ansible/ansible.git --recursive
source ~/ansible/hacking/env-setup

if [ -z $(cat ~/.profile | grep "ansible/hacking/env-setup") ]; then
  echo "source ~/ansible/hacking/env-setup -q   # -q makes it silent" >> ~/.profile
fi

mkdir -p /etc/ansible/

cat >/etc/ansible/hosts <<EOL
[raspi]
${IP}
EOL

printf "\033[1;32m\n\nTest conection to raspberry\033[0m\n"
ansible raspi -m ping
