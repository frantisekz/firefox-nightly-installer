#!/bin/bash

ver="29" #TODO : autodetection of latest version
arch=$(uname -m)
user=$(whoami)
file="Nightly.desktop"

mkdir $HOME/.tmp-install/
cd $HOME/.tmp-install/
echo "Downloading firefox nightly..."
wget http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/firefox-"$ver".0a1.en-US.linux-"$arch".tar.bz2
tar -xf firefox-"$ver".0a1.en-US.linux-"$arch".tar.bz2

sudo mkdir -p /opt/firefox/nightly
sudo chown -R "$user" /opt/firefox/nightly #Fixes self-updating
mv firefox/* /opt/firefox/nightly
sudo ln -s /opt/firefox/nightly/firefox /usr/local/bin/nightly

#Launcher
	wget http://img.zatloukalu.eu/nightly.png -O $HOME/.mozilla/nightly.png
	echo \[Desktop Entry\] >> "$file"
	echo Type=Application >> "$file"
	echo Terminal=false >> "$file"
	echo "Categories=GNOME;GTK;Network;WebBrowser;"  >> "$file"
	echo Name=nightly-"$file" >> "$file"
	echo Icon=$HOME/.mozilla/nightly.png >> "$file"
	echo Exec=nightly %u >> "$file"

chmod +x "$file"

echo "Done, now copying the launcher to the system level" 
sudo cp "$file" /usr/share/applications
sudo cp "$file" $HOME/
echo "Launcher is available in your home folder too"
cd ..
rm -R $HOME/.tmp-install/