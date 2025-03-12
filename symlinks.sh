# Ack
ln -sf ~/dotfiles/.ackrc ~/.ackrc

# Environment settings
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.private_profile ~/.private_profile

# Git
rm ~/.gitconfig
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore

# Tmux
ln -sf ~/dotfiles/tmux/ ~/.tmux
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Neovim
ln -sf ~/dotfiles/nvim ~/.config/nvim

# Zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# VSCode
ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

# Cursor
ln -sf ~/dotfiles/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
ln -sf ~/dotfiles/cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json

# Lein
ln -sf ~/dotfiles/lein/profiles.clj ~/.lein/profiles.clj

# Ctags
ln -sf ~/dotfiles/ctags ~/.ctags

# Alacritty
ln -sf ~/dotfiles/alacritty.toml ~/.config/.alacritty.toml
