# Add symlinks
ln -sfn ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
rm -rf ~/.bash_profile
rm ~/.bashrc
rm ~/.gitconfig
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.ackrc ~/.ackrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore
