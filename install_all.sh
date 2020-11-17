echo "setup zsh manually.."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "git, zsh and vim setup.."
sudo yum install -y zsh

git clone git@github.com:neeleshdewangan/setup-linux.git
cp setup-linux/.zshrc ~/.
cp -r setup-linux/.vim ~/.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
cp ~/.vim/bundle/gruvbox/colors/gruvbox.vim ~/.vim/colors/
vim +PluginInstall +qall
sudo chsh -s $(which zsh) ec2-user

sudo yum install -y tmux tree

echo "git username and password store.."
cd ./setup-linux/
git config --global user.email "neelesh.dewangan@smartnews.com"
git config --global user.name "neeleshdewangan"
git config credential.helper store
git push origin HEAD
cd ..

chmod +x $HOME/.vim/scripts/shopt

mkdir -p $HOME/library
cd $HOME/library
aws s3 cp s3://smartad-dmp/lib/lightlda.tgz $HOME/library/
tar zxvf lightlda.tgz
rm lightlda.tgz
cd -

sh $HOME/box/ec2/scripts/setup_conda.sh

zsh
