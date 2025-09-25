#!/bin/bash
 
# 22/09/2025
# christian.pottier@univ-angers.fr
#  
# maj Debian 13

if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi

source /opt/ansible/vansible/bin/activate
cd /opt/ansible/madeb13
echo "debut $(date) madeb" | sudo tee preseed.log
# playbook de base madeb
ansible-playbook playbooks/madeb.yml -i localhost, -c local
echo "fin $(date) madeb"| sudo tee -a preseed.log
deactivate
