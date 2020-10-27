
sudo git clone https://aur.archlinux.org/snapd.git
sudo chmod +x snapd
sudo 
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo pacman -Syyu gcc
sudo snap install hello-world
sudo snap install code --classic
sudo pacman -Sy kitty

sudo snap install prospect-mail
sudo snap install teams-for-linux
sudo snap install remmina
sudo pacman -S virtualbox
sudo gpasswd -a $USERS vboxusers
sudo modprobe vboxdrv
yay -Syy
yay -S virtualbox-ext-oracle
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service


echo $SHELL
sudo pacman -S zsh

sudo git clone https://github.com/bomburr/sysdots.git

cd sysdots
sudo -r rm git
sudo cp -r .* ~/
