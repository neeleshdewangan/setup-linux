mkdir -p ~/Desktop/projects/
mkdir -p ~/Desktop/library/iterm/

git clone git@github.com:neeleshdewangan/setup-linux.git
git checkout mac
cp setup-linux/.zshrc ~/.
cp -r setup-linux/.vim ~/.
cp ~/.vim/scripts/material-design-colors.itermcolors ~/Desktop/library/iterm/
chmod +x ~/.vim/script/shopt
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "git username and password store.."
cd ./setup-linux/
git config --global user.email "neeleshdewangan@smartnews.com"
git config --global user.name "neeleshdewangan"
git config credential.helper store
git push origin HEAD
cd ..

source ~/.zshrc
zsh
