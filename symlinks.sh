# Ack
ln -sf ~/dotfiles/.ackrc ~/.ackrc

# Ag
ln -sf ~/dotfiles/.agignore ~/.agignore

# Environment settings
ln -sf ~/dotfiles/.profile ~/.profile

# Git
rm ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore

# Tmux
ln -sf ~/dotfiles/tmux/ ~/.tmux
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Vim
ln -sfn ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc

# Zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
