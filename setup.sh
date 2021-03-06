#!/bin/bash

mkdir -p ~/tmp

# install development tools
sudo dnf groups install "Development Tools"
sudo dnf groups install "C Development Tools and Libraries"
sudo dnf install neovim guake tmux zsh xfce4-notes nm-applet shutter yumex-dnf dnf-plugins-core

# setup docker
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf makecache
sudo dnf install docker-ce
sudo systemctl start docker

# setup tmuxifier
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

# install nvm / node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
nvm install node

npm install -g yarn eslint babel-eslint eslint-plugin-react prettier

# install i3
sudo dnf install i3 i3status dmenu i3lock xbacklight feh conky scrot

# install i3-gaps
cd ~/tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# setup prezto
./zinstall.zsh

# setup dotfiles
mkdir -p .config/i3
mkdir -p .config/i3status

ln -s /home/blittle/dev/sputnik/dotfiles/.eslintrc /home/blittle/.eslintrc
ln -s /home/blittle/dev/sputnik/dotfiles/.gitconfig /home/blittle/.gitconfig
ln -s /home/blittle/dev/sputnik/dotfiles/.vimrc.after /home/blittle/.vimrc.after
ln -s /home/blittle/dev/sputnik/dotfiles/.zprofile /home/blittle/.zprofile
ln -s /home/blittle/dev/sputnik/dotfiles/.profile /home/blittle/.profile
ln -s /home/blittle/dev/sputnik/dotfiles/i3config /home/blittle/.config/i3/config
ln -s /home/blittle/dev/sputnik/dotfiles/i3status.config /home/blittle/.config/i3status/config
ln -s /home/blittle/dev/sputnik/dotfiles/tmux.conf /home/blittle/.tmux.conf
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

echo 'source "/home/blittle/.zsh.after"' >> /home/blittle/.zshrc

rm -rf ~/tmp
