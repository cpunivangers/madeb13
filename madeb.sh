#!/bin/bash
 
# 22/09/2025
# christian.pottier@univ-angers.fr
#  
# maj Debian 13

if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi
#~ if [ "$(id -u)" != "0" ]; then
	#~ echo "Sorry, you are not root."
	#~ echo "sudo $0 ou sudo -i"
	#~ exit 1
#~ fi

source /opt/ansible/vansible/bin/activate
cd /opt/ansible/madeb13
echo "debut $(date) madeb" | sudo tee preseed.log
# playbook de base madeb
ansible-playbook playbooks/madeb.yml -i localhost, -c local -K
echo "fin $(date) madeb"| sudo tee -a preseed.log
deactivate
