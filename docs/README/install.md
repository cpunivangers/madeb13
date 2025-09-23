## Installation madeb13

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**  

- Faire les mises à jour :

      sudo apt update && sudo apt -y dist-upgrade

- Si ce n'est pas la première installation de **madeb13** et pour une ré-initialisation complète (Firefox, XFCE), supprimer les 2 répertoires :

		rm -rf ~/.mozilla && rm -rf ~/.config/xfce4

- Récupération ansible pour madeb13 et installation madeb (/opt/ansible/madeb13) :

### en automatique :

      sudo apt -y install curl
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb13/main/update_madeb13.sh | bash

### ou en deux temps :

- Téléchargement du script :

		wget https://raw.githubusercontent.com/cpunivangers/madeb13/main/update_madeb13.sh

- Redémarrage
- Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**
- Lancer le script :

		bash update_madeb13.sh

## Principales opérations réalisées par le script :

- Mise à jour Debian
- Création d'un environnement virtuel python3 avec pip et ansible
- Téléchargement de la dernière version madeb13 : 13.aammjj.hhmn.tar.gz [https://github.com/cpunivangers/madeb13/releases/latest](https://github.com/cpunivangers/madeb13/releases/latest)
- Extraction dans /opt/ansible/
- Exécution du playbook **madeb.yml** en local

## Autres opérations possibles :

- Si nécessaire, vous pouvez relancer la configuration **madeb** en tapant dans un terminal :

		madeb

- Mise à jour madeb13 et exécution :

	**madeb13** est régulièrement mise à jour, vous pouvez mettre à jour votre machine en tapant dans un terminal :

		update_madeb