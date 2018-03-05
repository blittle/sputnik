ln -s /home/blittle/dev/sputnik/dotfiles/.zprofile /home/blittle/.zprofile
ln -s /home/blittle/dev/sputnik/dotfiles/.profile /home/blittle/.profile
ln -s /home/blittle/dev/sputnik/dotfiles/tmux.conf /home/blittle/.tmux.conf
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

echo 'source "/home/blittle/.zsh.after"' >> /home/blittle/.zshrc

rm -rf ~/tmp
