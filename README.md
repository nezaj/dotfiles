My secret sauce for getting things done.

* [Instructions](#instructions)
* [Plugins](#vim-plugins)

## Instructions
Clone this repo into `~/dotfiles`
Get homebrew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Dependencies
```
brew install ack
brew install ag
brew install editorconfig
```

### Python setup
```
brew install python
pip install ipython
```

### JS setup
```
brew install node
npm i -g prettier
npm i -g yarn
npm i -g create-react-app
```

### Java setup
```
brew install java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# For clojure
brew install clojure
brew install leiningen
```

### Tmux setup
```
brew install tmux
cd ~/dotfiles
git submodule init
git submodule update --init --recursive
```

### Vim setup
```
brew install vim
cd ~/dotfiles
git submodule init
git submodule update --init --recursive
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
```

### Additional tools
```
brew install jq  # CLI for json parsing
brew install httpie  # User-friendly cURL replacement
pip install grip  # Github-flavored markdown previewer
```

Install [Visual Studio](https://code.visualstudio.com/docs/setup/mac)

Finally, add all the symlinks
```
. symlinks.sh
```

And we're done. Huzzah!

### Tmux plugins
For the list of installed tmux plugins run `ls ~/dotfiles/.git/modules/tmux/plugin`

If you want to add a new plugin use the following command
```
git submodule add [PLUGIN_GIT_REPO] tmux/plugin/[PLUGIN_NAME] cat .gitmodules
```

To delete a plugin use the following commands
```
git submodule deinit tmux/plugin/[PLUGIN_NAME]
git rm tmux/plugin/[PLUGIN_NAME]
git rm --cached tmux/plugin/[PLUGIN_NAME]
rm -rf .git/modules/tmux/plugin/[PLUGIN_NAME]
rm -rf tmux/plugin/[PLUGIN_NAME]
```

### Vim plugins
For the list of installed vim plugins run `ls ~/dotfiles/.git/modules/vim/bundle`

If you want to add a new plugin use the following command
```
git submodule add [PLUGIN_GIT_REPO] vim/bundle/[PLUGIN_NAME] cat .gitmodules
```

To delete a plugin use the following commands
```
git submodule deinit vim/bundle/[PLUGIN_NAME]
git rm vim/bundle/[PLUGIN_NAME]
git rm --cached vim/bundle/[PLUGIN_NAME]
rm -rf .git/modules/vim/bundle/[PLUGIN_NAME]
rm -rf vim/bundle/[PLUGIN_NAME]
```

Additionally add or delete the plugin from `.tmux.conf`

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
* 10/22/20 -- There's an issue between `vim-fireplace` and `vim-cljfmt` where vim-cljfmt is clearing the buffer. The current fix is reverting `vim-fireplace` to commit `8a4f232e9844d73adb41eb29148f0c046c730f98`
