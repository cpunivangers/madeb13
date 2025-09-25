#!/bin/sh
 
# 25/11/2019
# christian.pottier@univ-angers.fr
# 
# lance playbook local

if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi

source /opt/ansible/vansible/bin/activate
cd /opt/ansible/madeb13
ansible-playbook -i localhost, -e 'ansible_host=127.0.0.1 mac=00:00:00:00:00:00' -c local playbooks/$*
deactivate
