#!/bin/bash
 
# 10/2023
# christian.pottier@univ-angers.fr
# Préparation changement de l'indentifiant principal

if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root."
	echo "sudo $0 ou sudo -i"
	exit 1
fi

OLD_LOGIN=$(id -un -- 1000)
NEW_LOGIN="$1"
	
if [ -z "$NEW_LOGIN" ] ; then
	exit
fi
echo "$OLD_LOGIN => $NEW_LOGIN"
if [ "$OLD_LOGIN" = "$NEW_LOGIN" ] ; then
	rm -f /var/NEW_USERNAME
	exit 0
fi
exit
echo "NEW_LOGIN=$NEW_LOGIN" > /var/NEW_USERNAME

if [ -f /etc/rc.local ]; then
	cp /etc/rc.local /etc/rc.local.svg
fi
cp -f /opt/ansible/madeb12/playbooks/files/oem-install/change_login.sh /etc/rc.local
chmod +x /etc/rc.local

echo -n "Reboot ..."
read tempo
reboot
