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
brew install java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
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

On first load install plugins

```
vim
:PlugInstall
```

### Zsh setup

```
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
cp ~/dotfiles/zsh/themes/nezaj.zsh-theme ~/.oh-my-zsh/themes/nezaj.zsh-theme
```

### Apple setup

```
# make keys repeat properly
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

# Set hostname for iterm2
sudo scutil --set HostName 'yourHostName'
```

### Additional tools

```
brew install jq  # CLI for json parsing
pip install grip  # Github-flavored markdown previewer
```

Install [Visual Studio](https://code.visualstudio.com/docs/setup/mac)
Install [Postgress.app](https://postgresapp.com/)
Install [iterm2](https://iterm2.com/)

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

### Known issues

(TODO: May be out of date)

-   10/22/20 -- There's an issue between `vim-fireplace` and `vim-cljfmt` where vim-cljfmt is clearing the buffer. The current fix is reverting `vim-fireplace` to commit `8a4f232e9844d73adb41eb29148f0c046c730f98` [See issue][cljfmt-issue]

[cljfmt-issue]: https://github.com/venantius/vim-cljfmt/issues/48
