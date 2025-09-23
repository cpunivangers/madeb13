#!/bin/bash
 
# 14/09/2023
# christian.pottier@univ-angers.fr
#
if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi

sudo pkill xfconfd

sudo rm -rd ~/.cache/sessions
sudo rm -rf ~/.config/xfce4
sudo rm -rf ~/.config/xfce4.tar
sudo rm -rf /etc/skel/.config/xfce4.tar

# Téléchargement ansible madeb
curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/playbooks/files/update_madeb12.sh > /tmp/update_madeb12.sh
bash /tmp/update_madeb12.sh download

source /opt/ansible/vansible/bin/activate
cd /opt/ansible/madeb12
echo "debut $(date) mini_deb12" | sudo tee mini_deb12.log
# playbook mini deb12
ansible-playbook playbooks/tplinux.yml -i localhost, -c local
echo "fin $(date) mini_deb12"| sudo tee -a mini_deb12.log
deactivate
