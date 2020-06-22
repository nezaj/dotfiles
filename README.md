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
brew install tmux
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
brew install yarn
```

### Java setup
```
brew tap caskroom/cask
brew install brew-cask
brew cask install java
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

Finally, add all the symlinks
```
. symlinks.sh
```

And we're done. Huzzah!

### Vim plugins
* [Ack][Ack] -- Grep across project directory
* [Ale][Ale] -- Aysnc linting, requires Vim8+
* [aysncrun.vim][asyncrun] -- Run shell commands in background, requires Vim8+
* [Autoclose][Autoclose] -- Autoclose parenthesis, curly braces, etc.
* [Ctrlp][Ctrlp] -- Fuzzy file searching across project directory
* [Editorconfig-vim][editconfig] -- Per project editor configurations
* [Fugitive][Fugitive]  -- Git wrapper inside Vim, I only use this for Gblame
* [Lightline][Lightline] -- Like PowerLine but no need to download special fonts
* [NerdTree][NerdTree] -- File directory browser
* [SuperTab][SuperTab] -- Better tab completion behavior
* [TComment][TComment] -- Comment code super easily
* [vim-jinja][vim-jinja] -- Syntax highlighting for jinja2 templates
* [vim-javascript][vim-javascript] -- Syntax highlighting for javascript
* [vim-jsx][vim-jsx] -- Syntax highlighting for jsx files

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
```

### Updating dotfiles on machine
```
cd ~/dotfiles
git pull
git submodule init
git submodule update --init --recursive
. symlinks.sh
. ~/.profile
```

[Ack]: https://github.com/mileszs/ack.vim.git
[Ale]: https://github.com/w0rp/ale
[asyncrun]: https://github.com/skywind3000/asyncrun.vim
[Autoclose]: https://github.com/Townk/vim-autoclose
[editconfig]: https://github.com/editorconfig/editorconfig-vim
[CtrlP]: https://github.com/kien/ctrlp.vim.git
[Fugitive]: https://github.com/tpope/vim-fugitive
[LightLine]: https://github.com/itchyny/lightline.vim
[NerdTree]: https://github.com/scrooloose/nerdtree.git
[SuperTab]: https://github.com/ervandew/supertab]
[TComment]: https://github.com/tomtom/tcomment_vim
[vim-jinja]: https://github.com/mitsuhiko/vim-jinja
[vim-javascript]: https://github.com/pangloss/vim-javascript
[vim-jsx]: https://github.com/mxw/vim-jsx
