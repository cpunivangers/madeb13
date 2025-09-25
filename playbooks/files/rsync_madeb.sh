#!/bin/sh
 
# 11/09/2023
# christian.pottier@univ-angers.fr
#  
# maj /opt/ansible/madeb d'un poste avec rsync

if [ -z $1 ]; then
	echo -n Adresse IP du poste :
	read IPDEST
else
	IPDEST=$1
fi
if [ -z $IPDEST ]; then
	exit 0
fi
if ( echo "$IPDEST" | grep -q @ ) ; then
	UTIL=${IPDEST%%@*}
	IPDEST=${IPDEST##*@}
else
	if [ -z $2 ]; then
		UTIL=administrateur
	else
		UTIL=$2
	fi
fi

rsync -avx --progress --delete ../madeb12 $UTIL@$IPDEST:/opt/ansible/
exit

