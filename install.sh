
sudo git clone https://aur.archlinux.org/snapd.git
sudo chmod +x snapd
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap


if sudo snap install hello-world
then 
    echo "snap is installed!"


fi

if hello-world
then 
    echo "Hello World Worked !"

fi

if sudo snap install code --classic
then
    echo  "VS Code Installed"
fi

if sudo pacman -Sy kitty
then
    echo "Kitty Installed !'"

fi


echo $SHELL
sudo pacman -S zsh

sudo git clone https://github.com/bomburr/sysdots.git

cd sysdots
sudo -r rm git
sudo cp -r .* ~/
