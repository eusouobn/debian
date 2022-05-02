#!/bin/bash

sudo localectl set-x11-keymap br abnt2 thinkpad

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo 'deb http://debian.pop-sc.rnp.br/debian unstable main contrib non-free' | sudo tee /etc/apt/sources.list 

sudo apt update

sudo apt install -y curl zstd && curl 'https://liquorix.net/add-liquorix-repo.sh' | sudo bash && sudo apt-get install -y linux-image-liquorix-amd64 linux-headers-liquorix-amd64 && sudo update-grub

echo "alias att='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'" >>  ~/.zshrc

echo "alias reboot='systemctl reboot'" >>  ~/.zshrc

echo -e 'APT::Install-Suggests "false";' | sudo tee /etc/apt/apt.conf

echo -e 'vm.dirty_background_ratio = 2 \nvm.dirty_ratio = 5' | sudo tee /etc/sysctl.conf && sudo sysctl -p 

sudo apt install -y wireplumber pipewire-pulse pipewire-audio-client-libraries libspa-0.2-jack pipewire-media-session-

systemctl --user --now enable wireplumber.service

sudo cp /usr/share/doc/pipewire/examples/alsa.conf.d/99-pipewire-default.conf /usr/share/alsa/alsa.conf.d/

bash && sudo cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-*.conf /etc/ld.so.conf.d/ && sudo ldconfig

sudo apt purge pulseaudio-module-bluetooth

sudo dpkg --add-architecture i386 && sudo apt install -y firmware-linux-nonfree firmware-linux-free firmware-linux pipewire libspa-0.2-bluetooth ubuntu-fonts mtp-tools gvfs-backends simplescreenrecorder ffmpeg psensor synaptic gimp gnome-disk-utility frei0r-plugins ntfs-3g exfat-fuse gsmartcontrol rar unrar-free obs-studio uget adb fastboot mtp-tools gvfs-backends qbittorrent winff unace zip unzip p7zip-full sharutils uudeview mpack arj unrar-free file-roller fonts-roboto telegram-desktop gamemode fonts-noto-color-emoji f2fs-tools fatsort mpv audacious inkscape audacity gdebi papirus-icon-theme

sudo dpkg --add-architecture i386 && wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key && echo deb https://dl.winehq.org/wine-builds/debian/ bullseye main | sudo tee /etc/apt/sources.list.d/winehq.list && sudo apt update && sudo apt install --install-recommends winehq-staging -y

sudo apt install bluetooth bluez bluez-firmware pavucontrol blueman 

sudo dpkg --add-architecture i386 && sudo apt update && sudo apt purge amd64-microcode va-driver-all mesa-va-drivers && sudo apt install --install-recommends -y i965-va-driver libegl1-mesa libegl1-mesa-dev libgl1-mesa-dri libgl1-mesa-dri:i386 libgl1-mesa-glx libgl1-mesa-glx:i386 libglapi-mesa libglapi-mesa:i386 libgles2-mesa mesa-utils mesa-vulkan-drivers

echo -e 'Section "Device"\n Identifier "Intel Graphics"\n Driver "Intel"\n Option "TearFree" "true"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/20-intel.conf

sudo systemctl disable NetworkManager-wait-online.service

sudo truncate -s 0 /swapfile && sudo chattr +C /swapfile && sudo btrfs property set /swapfile compression none && sudo fallocate -l 4096M /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile && echo -e '/swapfile none swap defaults 0 0\n' | sudo tee -a /etc/fstab

sudo apt install -y galculator xfce4-screenshooter ristretto mousepad hardinfo audacious

echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_Unstable/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list && wget -q https://download.opensuse.org/repositories/home:/strycore/Debian_Unstable/Release.key -O- | sudo apt-key add - && sudo apt update && sudo apt install lutris -y

sudo apt install qt5ct -y && echo -e '\nQT_QPA_PLATFORMTHEME=qt5ct\nQT_AUTO_SCREEN_SCALE_FACTOR=0' | sudo tee -a /etc/environment

echo -e 'net.ipv4.ping_group_range = 1000 1000' | sudo tee -a /etc/sysctl.d/60-mysql.conf

sudo cp /usr/share/applications/gdebi.desktop /usr/share/applications/gdebi.desktop.bak && sudo sed -i '155c\Exec=sh -c "gdebi-gtk %f"' /usr/share/applications/gdebi.desktop

git clone http://github.com/eusouobn/xfce
cd xfce
tar -xvf xfce-perchannel-xml.tar.xz
rm -r ~/.config/xfce4/xfconf/xfce-perchannel-xml
mv xfce-perchannel-xml ~/.config/xfce4/xfconf/
cd ..
sudo rm -r xfce

sudo apt install -y ttf-mscorefonts-installer ubuntu-fonts fonts-liberation2

sudo dpkg-reconfigure fontconfig-config

mkdir -p ~/.config/fontconfig/

mv ~/debian/fonts.conf ~/.config/fontconfig/

sudo apt install -y zsh git wget && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" & sudo sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sudo sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
