#!/bin/bash

ver="58"
arch=$(uname -m)
user=$(whoami)
file="Nightly.desktop"

mkdir $HOME/.tmp-install/
cd $HOME/.tmp-install/
echo "Downloading firefox nightly..."
wget https://archive.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-"$ver".0a1.en-US.linux-"$arch".tar.bz2
tar -xf firefox-"$ver".0a1.en-US.linux-"$arch".tar.bz2

sudo mkdir -p /opt/firefox/nightly
sudo chown -R "$user" /opt/firefox/nightly #Fixes self-updating
mv firefox/* /opt/firefox/nightly
sudo ln -s /opt/firefox/nightly/firefox /usr/local/bin/nightly

#Launcher
	wget https://upload.wikimedia.org/wikipedia/commons/5/5c/Firefox_Nightly_Logo%2C_2017.png -O $HOME/.mozilla/nightly.png 
	echo \[Desktop Entry\] >> "$file"
	echo Type=Application >> "$file"
	echo Terminal=false >> "$file"
	echo "Categories=GNOME;GTK;Network;WebBrowser;"  >> "$file"
	echo Name=Firefox Nightly >> "$file"
	echo Icon=$HOME/.mozilla/nightly.png >> "$file"
	echo Exec=nightly %u >> "$file"

chmod +x "$file"

echo "Done, now copying the launcher to the system level" 
sudo cp "$file" /usr/share/applications
#sudo cp "$file" $HOME/ #don't need
#echo "Launcher is available in your home folder too"
cd ..
rm -R $HOME/.tmp-install/
