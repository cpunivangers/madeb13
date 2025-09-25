#!/bin/bash
 
# 23/09/2025
# christian.pottier@univ-angers.fr
# 
# lance tache local
if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi

if [ -z $1 ]; then
	echo -n Nom de la tache :
	read ID_TASK
else
	ID_TASK=$1
fi
if [ -z $ID_TASK ]; then
	exit 0
fi
source /opt/ansible/vansible/bin/activate
cd /opt/ansible/madeb13
echo "debut $(date) $ID_TASK" | sudo tee task.log
ansible-playbook -i localhost, -e 'ansible_host=127.0.0.1 mac=00:00:00:00:00:00' -c local playbooks/sel_task.yml -e "id_task=$ID_TASK"
echo "fin $(date) $ID_TASK" | sudo tee -a task.log
deactivate
