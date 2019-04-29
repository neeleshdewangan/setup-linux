echo "Packman Setup..."
sudo zypper ar -cfp 90 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
sudo zypper ar -f http://opensuse-guide.org/repo/openSUSE_Tumbleweed/ dvd
sudo zypper ref
sudo zypper dup
sudo zypper install vlc vlc-codecs ffmpeg lame gstreamer-plugins-libav gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-good libdvdcss2

echo "git, zsh and vim setup.."
sudo zypper in zsh git
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/neel783d/setup-linux.git
cp setup-linux/.zshrc ~/.
cp -r setup-linux/.vim ~/.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
source ~/.zshrc

echo "git username and password store.."
cd ./setup-linux/
git config --global user.email "neel783d@gmail.com"
git config --global user.name "neel783d"
git config credential.helper store
git push origin HEAD
cd ..

echo "leecode client installation.."
sudo zypper install nodejs-common
sudo npm install -g leetcode-cli

echo "nvidia driver install.."
sudo zypper gcc make kernel-source kernel-devel
sudo sh /movies/Downloads/NVIDIA-Linux-x86_64-418.56.run

echo "add nomodeset to grub manually using:"
echo "-- sudo vim /etc/default/grub"
echo "-- add nomodeset in linux line and exit"
echo "-- update grub using: sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
echo "-- reboot"

