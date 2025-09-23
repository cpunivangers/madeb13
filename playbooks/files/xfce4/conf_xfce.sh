#!/bin/sh -e
 
# 04/2014
# christian.pottier@univ-angers.fr
# 07/02/2018 Debian 9
# 06/03/2018 raccourci clavier
# 24/03/2020 Dossiers_Distants

find ~/.config -name "xfce4-screenshooter" -exec sed -i "/administrateur/d" {} \;

#~12/04/2021 task ansible # Dossiers_Distants
#~12/04/2021 task ansible ln -sfT /run/user/$(id -u $USER)/gvfs ~/Dossiers_Distants

#~12/04/2021 task ansible # bookmarks
#~12/04/2021 task ansible FICHBOOKMARKS=$HOME/.config/gtk-3.0/bookmarks
#~12/04/2021 task ansible FICHBOOKMARKS_SVG=$HOME/.config/gtk-3.0/bookmarks.svg
#~12/04/2021 task ansible touch $FICHBOOKMARKS
#~12/04/2021 task ansible cp -f $FICHBOOKMARKS $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible echo "file:///home/$USER/Documents Documents" | tee $FICHBOOKMARKS
#~12/04/2021 task ansible sed -i -e "/Documents Documents/d" $FICHBOOKMARKS_SVG
#~12/04/2021 task ansible sed -i -e "/$USER\/Documents$/d" $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible echo "file:///home/$USER/Musique Musique" | tee -a $FICHBOOKMARKS
#~12/04/2021 task ansible sed -i -e "/Musique Musique/d" $FICHBOOKMARKS_SVG
#~12/04/2021 task ansible sed -i -e "/$USER\/Musique$/d" $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible echo "file:///home/$USER/Images Images" | tee -a $FICHBOOKMARKS
#~12/04/2021 task ansible sed -i -e "/Images Images/d" $FICHBOOKMARKS_SVG
#~12/04/2021 task ansible sed -i -e "/$USER\/Images$/d" $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible echo "file:///home/$USER/Vid%C3%A9os Vidéos" | tee -a $FICHBOOKMARKS
#~12/04/2021 task ansible sed -i -e "/Vid%C3%A9os Vidéos/d" $FICHBOOKMARKS_SVG
#~12/04/2021 task ansible sed -i -e "/$USER\/Vid%C3%A9os$/d" $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible echo "file:///home/$USER/Public Public" | tee -a $FICHBOOKMARKS
#~12/04/2021 task ansible sed -i -e "/Public Public/d" $FICHBOOKMARKS_SVG
#~12/04/2021 task ansible sed -i -e "/$USER\/Public$/d" $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible echo "file:///home/$USER/T%C3%A9l%C3%A9chargements Téléchargements" | tee -a $FICHBOOKMARKS
#~12/04/2021 task ansible sed -i -e "/T%C3%A9l%C3%A9chargements Téléchargement/d" $FICHBOOKMARKS_SVG
#~12/04/2021 task ansible sed -i -e "/$USER\/T%C3%A9l%C3%A9chargements$/d" $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible echo "file:///home/$USER/Dossiers_Distants" | tee -a $FICHBOOKMARKS
#~12/04/2021 task ansible sed -i -e "/Dossiers_Distants/d" $FICHBOOKMARKS_SVG
#~12/04/2021 task ansible sed -i -e "/$USER\/Dossiers_Distants$/d" $FICHBOOKMARKS_SVG

#~12/04/2021 task ansible cat $FICHBOOKMARKS_SVG | tee -a $FICHBOOKMARKS

# 23/09/2014 texte entier sous incone + transparence
echo 'style "xfdesktop-icon-view" {
	# ne pas tronquer les noms des icônes
	XfdesktopIconView::ellipsize-icon-labels = 0
#	 # Transparence totale du cadre du texte des icônes : 0, totalement opaque : 100
	XfdesktopIconView::label-alpha = 0
#	XfdesktopIconView::selected-label-alpha = 0
#	XfdesktopIconView::tooltip-size = 128
#	base[NORMAL] = "#000000"
#	base[SELECTED] = "#71B9FF"
#	base[ACTIVE] = "#71B9FF"
	fg[NORMAL] = "#fcfcfc"
	fg[SELECTED] = "#ffffff"
	fg[ACTIVE] = "#ffffff"
}
widget_class "*XfdesktopIconView*" style "xfdesktop-icon-view"' > ~/.gtkrc-2.0

# 25/09/2014 Ajout caja
#12/05/2015#CAJA=`which caja`
#12/05/2015#if [ ! -z "$CAJA" ]; then
#12/05/2015#	mkdir -p ~/.local/share/xfce4/helpers
#12/05/2015#	echo '[Desktop Entry]
#12/05/2015#	NoDisplay=true
#12/05/2015#	Version=1.0
#12/05/2015#	Encoding=UTF-8
#12/05/2015#	Type=X-XFCE-Helper
#12/05/2015#	X-XFCE-Category=FileManager
#12/05/2015#	X-XFCE-CommandsWithParameter=caja --no-desktop --browser "%s"
#12/05/2015#	Icon=caja
#12/05/2015#	Name=caja
#12/05/2015#	X-XFCE-Commands=caja --no-desktop' > ~/.local/share/xfce4/helpers/custom-FileManager.desktop
#12/05/2015#fi
#09/09/2019#	adaptation Deb 10 plus corrections diverses

#~12/04/2021 task ansible # 12/05/2015 Ajout action redimensionner images
#~12/04/2021 task ansible FICHTMP="/tmp/"$USER"_uca.xml"
#~12/04/2021 task ansible if !(grep -q "Image-Resize" /home/$USER/.config/Thunar/uca.xml) ; then
	#~12/04/2021 task ansible sed '/<\/actions/,$d'  ~/.config/Thunar/uca.xml > $FICHTMP
	#~12/04/2021 task ansible echo "<action>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<icon>display-im6.q16</icon>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<name>Redimensionner Photos Images</name>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<unique-id>1431428885300447-5</unique-id>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<command>sh /opt/madeb/Image-Resize %F</command>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<description>Redimensionner Photos Images</description>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<patterns>*</patterns>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<image-files/>" >> $FICHTMP
	#~12/04/2021 task ansible echo "</action>" >> $FICHTMP
	#~12/04/2021 task ansible echo "</actions>" >> $FICHTMP
	#~12/04/2021 task ansible cp $FICHTMP /home/$USER/.config/Thunar/uca.xml
#~12/04/2021 task ansible fi
#~12/04/2021 task ansible # 27/09/2016 Rechercher ici
#~12/04/2021 task ansible # 12/11/2019 Remplace catfish par mate-search-tool
#~12/04/2021 task ansible if !(grep -q "Rechercher ici" /home/$USER/.config/Thunar/uca.xml) ; then
	#~12/04/2021 task ansible sed '/<\/actions/,$d'  ~/.config/Thunar/uca.xml > $FICHTMP
	#~12/04/2021 task ansible echo "<action>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<icon>/usr/share/icons/Tango/scalable/actions/search.svg</icon>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<name>Rechercher ici</name>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<unique-id>1474986341105993-3</unique-id>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<command>/usr/bin/mate-search-tool --path=%f</command>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<description>Rechercher dans ce dossier</description>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<patterns>*</patterns>" >> $FICHTMP
	#~12/04/2021 task ansible echo "\t<directories/>" >> $FICHTMP
	#~12/04/2021 task ansible echo "</action>" >> $FICHTMP
	#~12/04/2021 task ansible echo "</actions>" >> $FICHTMP
	#~12/04/2021 task ansible cp $FICHTMP /home/$USER/.config/Thunar/uca.xml
#~12/04/2021 task ansible fi
# 12/11/2019 URL Windows
if !(grep -q "URLWindows" /home/$USER/.config/Thunar/uca.xml) ; then
	sed '/<\/actions/,$d'  ~/.config/Thunar/uca.xml > $FICHTMP
	echo "<action>" >> $FICHTMP
	echo "\t<icon>applications-internet</icon>" >> $FICHTMP
	echo "\t<name>URLWindows</name>" >> $FICHTMP
	echo "\t<command>bash -c &quot;cat %f | grep &apos;URL=&apos; | cut -d= -f2 | xargs firefox &amp;&quot;</command>" >> $FICHTMP
	echo "\t<description>Ouvrir raccourci windows</description>" >> $FICHTMP
	echo "\t<patterns>*.url</patterns>" >> $FICHTMP
	echo "\t<other-files/>" >> $FICHTMP
	echo "\t<text-files/>" >> $FICHTMP
	echo "</action>" >> $FICHTMP
	echo "</actions>" >> $FICHTMP
	cp $FICHTMP /home/$USER/.config/Thunar/uca.xml
fi

# 25/10/2018 partage Samba
if ! ( apt-cache policy samba | grep Installé | grep -q aucun ) ; then
	if !(grep -q "Partage (R)" /home/$USER/.config/Thunar/uca.xml) ; then
		sed '/<\/actions/,$d'  ~/.config/Thunar/uca.xml > $FICHTMP
		echo "<action>" >> $FICHTMP
		echo "\t<icon>preferences-system-sharing</icon>" >> $FICHTMP
		echo "\t<name>Partage (R)</name>" >> $FICHTMP
		echo "\t<command>net usershare add %n %f &quot;&quot; Everyone:R guest_ok=y &amp;&amp; chmod 775 %f &amp;&amp; gvfs-set-attribute %f -t stringv metadata::emblems emblem-web</command>" >> $FICHTMP
		echo "\t<description>Partage avec samba en Lecture seule</description>" >> $FICHTMP
		echo "\t<patterns>*</patterns>" >> $FICHTMP
		echo "\t<directories/>" >> $FICHTMP
		echo "</action>" >> $FICHTMP
		echo "</actions>" >> $FICHTMP
		cp $FICHTMP /home/$USER/.config/Thunar/uca.xml
	fi
	if !(grep -q "Partage (RW)" /home/$USER/.config/Thunar/uca.xml) ; then
		sed '/<\/actions/,$d'  ~/.config/Thunar/uca.xml > $FICHTMP
		echo "<action>" >> $FICHTMP
		echo "\t<icon>preferences-system-sharing</icon>" >> $FICHTMP
		echo "\t<name>Partage (RW)</name>" >> $FICHTMP
		echo "\t<command>net usershare add %n %f &quot;&quot; Everyone:F guest_ok=y &amp;&amp; chmod 777 %f &amp;&amp; gvfs-set-attribute %f -t stringv metadata::emblems emblem-web</command>" >> $FICHTMP
		echo "\t<description>Partage avec samba en Lecture Ecriture</description>" >> $FICHTMP
		echo "\t<patterns>*</patterns>" >> $FICHTMP
		echo "\t<directories/>" >> $FICHTMP
		echo "</action>" >> $FICHTMP
		echo "</actions>" >> $FICHTMP
		cp $FICHTMP /home/$USER/.config/Thunar/uca.xml
	fi
	if !(grep -q "Fin Partage" /home/$USER/.config/Thunar/uca.xml) ; then
		sed '/<\/actions/,$d'  ~/.config/Thunar/uca.xml > $FICHTMP
		echo "<action>" >> $FICHTMP
		echo "\t<icon>preferences-system-sharing-symbolic</icon>" >> $FICHTMP
		echo "\t<name>Fin Partage</name>" >> $FICHTMP
		echo "\t<command>net usershare delete %n &amp;&amp; gvfs-set-attribute %f -t stringv metadata::emblems none</command>" >> $FICHTMP
		echo "\t<description>Fin Partage du répertoire avec Samba</description>" >> $FICHTMP
		echo "\t<patterns>*</patterns>" >> $FICHTMP
		echo "\t<directories/>" >> $FICHTMP
		echo "</action>" >> $FICHTMP
		echo "</actions>" >> $FICHTMP
		cp $FICHTMP /home/$USER/.config/Thunar/uca.xml
	fi
fi
# 06/03/2018 Raccourci clavier
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>t" --reset
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>t" --create --type string -s "xfce4-terminal"

xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/Super_L" --reset
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/Super_L" --create --type string -s "xfce4-popup-whiskermenu"

xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>e" --reset
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>e" --create --type string -s "exo-open --launch FileManager"

# 05/01/2016 Action cd dvd
#xmlstarlet ed -L -u "channel[@name='thunar-volman']/property[@name='autoplay-audio-cds']/property[@name='command']/@value" -v "vlc cdda://" /home/$USER/.config/xfce4/xfconf/xfce-perchannel-xml/thunar-volman.xml
#xmlstarlet ed -L -u "channel[@name='thunar-volman']/property[@name='autoplay-video-cds']/property[@name='command']/@value" -v "vlc dvd://" /home/$USER/.config/xfce4/xfconf/xfce-perchannel-xml/thunar-volman.xml
