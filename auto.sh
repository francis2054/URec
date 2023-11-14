#!/bin/bash

# STILL IN UNTESTED STAGE
# Seems to break desktop environment at upgrade stage, unsure if this is because of live test environment or not

read -p "Press enter to start installation of DWagent"
cd ~
cd Downloads
wget https://www.dwservice.net/download/dwagent.sh
chmod +x dwagent.sh
sudo ./dwagent.sh
echo "DWagent Installation done"
read -p "Starting apfs-fuse installation in 2 seconds" -t 2
echo "Installing apfs-fuse"
cd
sudo apt update
sudo apt upgrade -y
sudo apt install fuse libfuse3-dev bzip2 libbz2-dev cmake gcc git libattr1-dev zlib1g-dev -y
sudo apt-get install "c++" -y 
git clone https://github.com/sgan81/apfs-fuse.git
cd apfs-fuse
git submodule init
git submodule update
mkdir build
cd build
cmake ..
make
read -p "Installation of apfs-fuse complete, copying apfs-fuse to executable location" -t 2
sudo cp -a . /usr/local/bin
echo "Installation done"
read -p "Verifying things are not broken" -t 2
sudo apt-get install build-essentials -y
sudo apt --fix-broken install -y
read -p "Cleaning up" -t 1
sudo apt autoremove -y
read -p "Starting installation of OSC" -t 3
cd ~
cd Downloads
wget https://github.com/ISpillMyDrink/OpenSuperClone/releases/download/v2.4.1/opensuperclone_2.4.1-1_amd64.deb
sudo dpkg -i opensuperclone_2.4.1-1_amd64.deb
echo "OSC Installation done"
read -p "Adding OSC to favourites" -t 2
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'opensuperclone.desktop']"
read -p "Starting installation of DMDE, press enter to open DMDE website to start manual installation of DMDE"
firefox "https://dmde.com/download.html/"
read -p "Press enter to add DMDE to path after installation is done"
echo -e "alias dmde='/home/$USER/dmde/dmde\nexport PATH=/home/$USER/bin:$PATH" >> /home/$USER/.bashrc
read -p "Creating DMDE shortcut" -t 3
cd /home/$USER/dmde
sudo rm -f logo.png
wget https://i.imgur.com/BRQ3STJ.png
mv BRQ3STJ.png logo.png
touch /home/$USER/.local/share/applications/dmde.desktop
echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=1.0\nTerminal=false\nIcon=/home/$USER/dmde/logo.png\nExec="/home/$USER/dmde/dmde"\nCategories=Application\nName=DMDE\nGenericName=DMDERECOVERY" >> /home/$USER/.local/usr/applications/dmde.desktop
read -p "Adding it to favourites" -t 2
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'dmde.desktop']"
