#!/bin/bash

ver="58"
arch=$(uname -m)
user=$(whoami)
file="Nightly Thunderbird.desktop"

mkdir $HOME/.tmp-install/
cd $HOME/.tmp-install/
echo "Downloading Thunderbird Nightly..."
wget https://archive.mozilla.org/pub/thunderbird/nightly/latest-comm-central/thunderbird-"$ver".0a1.en-US.linux-"$arch".tar.bz2
tar -xf thunderbird-"$ver".0a1.en-US.linux-"$arch".tar.bz2

sudo mkdir -p /opt/thunderbird/nightly
sudo chown -R "$user" /opt/thunderbird/nightly
mv thunderbird/* /opt/thunderbird/nightly
sudo ln -s /opt/thunderbird/nightly/thunderbird /usr/local/bin/nightly-thunderbird

#Launcher
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Thunderbird_Faenza.svg/2000px-Thunderbird_Faenza.svg.png -O $HOME/.mozilla/nightly-thunderbird.png 
	echo \[Desktop Entry\] >> "$file"
	echo Type=Application >> "$file"
	echo Terminal=false >> "$file"
	echo "Categories=GNOME;GTK;Network;Email;"  >> "$file"
	echo Name=Thunderbird Nightly >> "$file"
	echo Comment=Software made to make email easier. >> "$file"
	echo Icon=$HOME/.mozilla/nightly-thunderbird.png >> "$file"
	echo Exec=nightly %u >> "$file"

chmod +x "$file"

echo "Done, now copying the launcher to the system level" 
sudo cp "$file" /usr/share/applications
cd ..
rm -R $HOME/.tmp-install/
