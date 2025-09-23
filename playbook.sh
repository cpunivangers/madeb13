#!/bin/sh
 
# 25/11/2019
# christian.pottier@univ-angers.fr
# 
# lance playbook local

sudo ansible-playbook -i localhost, -e 'ansible_host=127.0.0.1 mac=00:00:00:00:00:00' -c local playbooks/$*
