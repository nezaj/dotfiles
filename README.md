# Migrating from vim to Neovim

My secret sauce for getting things done.

-   [Instructions](#instructions)
-   [Plugins](#vim-plugins)

## Instructions

Clone this repo into `~/dotfiles`
Get homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Dependencies

```
brew install --cask font-hack-nerd-font # Nerd Font
brew install neovim
brew tap burntsushi/ripgrep https://github.com/BurntSushi/ripgrep.git
brew install burntsushi/ripgrep/ripgrep-bin
brew install editorconfig
brew install ctags
brew install autojump
```

### Python setup

```
brew install python
pip3 install ipython
```

### JS setup

```
brew install node
npm i -g prettier
npm i -g yarn
npm i -g create-react-app
npm i -g live-server
npm i -g tldr
```

### Java setup

```
brew tap homebrew/cask-versions
brew install --cask corretto
brew install jenv
jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-22.jdk/Contents/Home
jenv global 22

# Optional if installed java 11
jenv add /opt/homebrew/Cellar/openjdk@11/11.0.21/libexec/openjdk.jdk/Contents/Home
```

# Clojure setup

```
brew install clojure
brew install leiningen
brew install borkdude/brew/clj-kondo
npm i -g shadow-cljs
```

### Tmux setup

```
brew install tmux
cd ~/dotfiles
git submodule init
git submodule update --init --recursive
```

### Neovim setup

First install Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then run PackerSync to install packages

```
nvim
:PackerSync
```

You may need to re-open nvim again to install the lsp servers

```
nvim
```

### Zsh setup

```
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
cp ~/dotfiles/zsh/themes/nezaj.zsh-theme ~/.oh-my-zsh/themes/nezaj.zsh-theme
```

### Terminal setup

First install [iterm2](https://iterm2.com/)

Then install [Alacritty](https://alacritty.org/)
```
brew install --cask alacritty
```

### Apple setup

```
# make keys repeat properly
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

# Set hostname for iterm2
sudo scutil --set HostName 'nezaj'
```

### Additional tools

```
brew install jq  # CLI for json parsing
pip install grip  # Github-flavored markdown previewer
```

Install [Visual Studio](https://code.visualstudio.com/docs/setup/mac)
Install [Postgress.app](https://postgresapp.com/)


Finally, add all the symlinks

```
. symlinks.sh
```

And we're done. Huzzah!

### Tmux plugins

Taken directly from [tpm github](https://github.com/tmux-plugins/tpm)

> ### Installing plugins
>
> 1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '...'`
> 2. Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.
>
> You're good to go! The plugin was cloned to `~/.tmux/plugins/` dir and sourced.
>
> ### Uninstalling plugins
>
> 1. Remove (or comment out) plugin from the list.
> 2. Press `prefix` + <kbd>alt</kbd> + <kbd>u</kbd> (lowercase u as in **u**ninstall) to remove the plugin.
>
> All the plugins are installed to `~/.tmux/plugins/` so alternatively you can
> find plugin directory there and remove it.

### Updating dotfiles on machine

```
cd ~/dotfiles
git pull
git submodule init
git submodule update --init --recursive
. symlinks.sh
. ~/.profile
```
