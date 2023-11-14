read -p "Press enter to start installation of DWagent"
cd ~
cd Downloads
wget https://www.dwservice.net/download/dwagent.sh
chmod +x dwagent.sh
sudo ./dwagent.sh
read -p "Press enter to add DMDE to path"
echo -e "alias dmde='/home/$USER/dmde/dmde\nexport PATH="/home/$USER/bin:$PATH" >> /home/$USER/.bashrc
read -p "Press enter to add DMDE to path"
echo "DMDE Installation done"
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
read -p "Adding DMDE desktop shortcut to favourites" -t 3
echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=1.0\nTerminal=false\nIcon=\nExec="/home/$USER/dmde/dmde"\nCategories=Application\nName=DMDE\GenericName=DMDERECOVERY" >> /home/$USER/.local/usr/applications/dmde.desktop
