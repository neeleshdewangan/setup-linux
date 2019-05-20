echo "git, zsh and vim setup.."
brew cask install iterm2
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/neel783d/setup-linux.git
git checkout mac
cp setup-linux/.zshrc ~/.
cp -r setup-linux/.vim ~/.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
source ~/.zshrc

echo "git username and password store.."
cd ./setup-linux/
git config --global user.email "neeleshdewangan@smartnews.com"
git config --global user.name "neeleshdewangan"
git config credential.helper store
git push origin HEAD
cd ..

