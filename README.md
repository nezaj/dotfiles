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
brew install reattach-to-user-namespace
brew install tmux
brew install ack
brew install editorconfig
```

### Python setup
```
brew install python
pip install ipython
pip install virtualenv
pip install virtualenvwrapper
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

### Additional tools
```
brew install jq  # CLI for json parsing
brew install tidy-html5  # html static analysis
brew install httpie  # User-friendly cURL replacement
```

Finally, add all the symlinks
```
. symlinks.sh
```

And we're done. Huzzah!

### Vim plugins
* [Ack][Ack] -- Grep across project directory
* [Autoclose][Autoclose] -- Autoclose parenthesis, curly braces, etc.
* [Ctrlp][Ctrlp] -- Fuzzy file searching across project directory
* [Editorconfig-vim][editconfig] -- Per project editor configurations
* [Fugitive][Fugitive]  -- Git wrapper inside Vim, I only use this for Gblame
* [Lightline][Lightline] -- Like PowerLine but no need to download special fonts
* [NerdTree][NerdTree] -- File directory browser
* [TComment][TComment] -- Comment code super easily
* [vim-jinja][vim-jinja] -- Syntax highlighting for jinja2 templates
* [vim-javascript][vim-javascript] -- Syntax highlighting for javascript
* [vim-jsx][vim-jsx] -- Syntax highlighting for jsx files

If you want to add a new plugin use the following command
```
git submodule add [PLUGIN_GIT_REPO] vim/bundle/[PLUGIN_NAME] cat .gitmodules
```

[Ack]: https://github.com/mileszs/ack.vim.git
[Autoclose]: https://github.com/Townk/vim-autoclose
[editconfig]: https://github.com/editorconfig/editorconfig-vim
[CtrlP]: https://github.com/kien/ctrlp.vim.git
[Fugitive]: https://github.com/tpope/vim-fugitive
[LightLine]: https://github.com/itchyny/lightline.vim
[NerdTree]: https://github.com/scrooloose/nerdtree.git
[TComment]: https://github.com/tomtom/tcomment_vim
[vim-jinja]: https://github.com/mitsuhiko/vim-jinja
[vim-javascript]: https://github.com/pangloss/vim-javascript
[vim-jsx]: https://github.com/mxw/vim-jsx
