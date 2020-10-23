wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*MacOSX-x86_64.*\.sh\)\">64-Bit Command Line Installer.*@\1@p' | xargs wget
sh Anaconda* -b -p $HOME/conda
rm Anaconda*.sh
eval "$($HOME/conda/bin/conda shell.zsh hook)"
conda init
conda activate $HOME/conda
