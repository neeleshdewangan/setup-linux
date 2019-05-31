echo "setup zsh manually.."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "git, zsh and vim setup.."
sudo yum install zsh

git clone https://github.com/neeleshdewangan/setup-linux.git
cp setup-linux/.zshrc ~/.
cp -r setup-linux/.vim ~/.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
cp ~/.vim/bundle/gruvbox/colors/gruvbox.vim ~/.vim/colors/
vim +PluginInstall +qall
sudo chsh -s $(which zsh) ec2-user
zsh

echo "git username and password store.."
cd ./setup-linux/
git config --global user.email "neelesh.dewangan@smartnews.com"
git config --global user.name "neeleshdewangan"
git config credential.helper store
git push origin HEAD
cd ..
