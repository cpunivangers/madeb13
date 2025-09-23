# Mise à niveau madeb12 vers madeb13

Mise à niveau de votre Debian 12 (madeb12) vers Debian 13 (madeb13)  

**Attention** Une mise à jour nécessite beaucoup d'espace.  
Vérifier l'espace disponible sur votre racine “/” avec la commande :  

	df h

## Sauvegarde

Vous devez au préalable sauvegarder vos données (/home) et fichiers de configuration si nécessaire.

Infos utiles :

[https://debian-facile.org/doc:migrer](https://debian-facile.org/doc:migrer)

[https://www.debian.org/News/2025/20250809](https://www.debian.org/News/2025/20250809) paragraphe "Mise à niveau"

[https://fr.wikitwist.com/mettre-a-jour-debian-12-vers-debian-13-trixie-guide-pas-a-pas/](https://fr.wikitwist.com/mettre-a-jour-debian-12-vers-debian-13-trixie-guide-pas-a-pas/)

## Script de migration (NON GARANTIE !)

### en automatique :

      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb13/main/playbooks/files/Divers/xdeb12toxdeb13.sh | bash

### en deux temps :

- Téléchargement du script

      wget https://raw.githubusercontent.com/cpunivangers/madeb13/main/playbooks/files/Divers/xdeb12toxdeb13.sh

- Redémarrage
- Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**
- Lancer le script :

		bash xdeb12toxdeb13.sh

## Principales opérations réalisées par ce script :

### Préparation

- Suppression des éléments madeb12
- Purge de divers paquets pouvant poser problèmes.
- Téléchargement de madeb13
- Extraction dans /opt/ansible/
- Déplacement des dépôts annexes vers /etc/apt/sources.list.d12
- Mise à jour de la Debian 12
- Nettoyage

### Mise à niveau vers Debian 13

- Mise à jour du sources.list par celui de la Debian 13
- Affichage de l'espace disque nécessaire pour le téléchargement des paquets.
- Mise à jour
- Exécution du playbook **madeb.yml** en local

## Redémarrer le poste

Vous pouvez mettre à jour vos logiciels de dépôts annexes, si nécessaire.

