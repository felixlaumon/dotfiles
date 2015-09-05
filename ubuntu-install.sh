if [ -f "apt-fast" ]; then
    apt-get = apt-fast
fi

sudo apt-get update

# general
sudo apt-get install -y apt-fast
sudo apt-get install -y python-software-properties software-properties-common python2.7-dev
sudo apt-get install -y tmux

# tig
sudo apt-get install -y libncursesw5-dev

# ag
sudo apt-get install -y automake libpcre3-dev liblzma-dev

# cpsm
sudo apt-get install -y libboost-all-dev libicu-dev

# neovim
sudo apt-get install -y neovim
