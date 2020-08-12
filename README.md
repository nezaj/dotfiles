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
* [TPM][TPM] -- Tmux plugin manager
* [Resurrect][resurrect] -- Save and restore tmux sessions
* [Continuum][continuum] -- Continuously save tmux sessions
* [Yank][yank] -- Enable tmux copy
* [Copycat][copycat] -- Better tmux search


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
```

### Vim plugins
* [Ack][Ack] -- Grep across project directory
* [Ale][Ale] -- Aysnc linting, requires Vim8+
* [aysncrun.vim][asyncrun] -- Run shell commands in background, requires Vim8+
* [Autoclose][Autoclose] -- Autoclose parenthesis, curly braces, etc.
* [fzf][fzf] -- Fuzzy file searching across project directory
* [Editorconfig-vim][editconfig] -- Per project editor configurations
* [Fugitive][Fugitive]  -- Git wrapper inside Vim, I only use this for Gblame
* [Lightline][Lightline] -- Like PowerLine but no need to download special fonts
* [NerdTree][NerdTree] -- File directory browser
* [SuperTab][SuperTab] -- Better tab completion behavior
* [TComment][TComment] -- Comment code super easily
* [vim-jinja][vim-jinja] -- Syntax highlighting for jinja2 templates
* [vim-javascript][vim-javascript] -- Syntax highlighting for javascript
* [vim-jsx-pretty][vim-jsx-pretty] -- Syntax highlighting for jsx files
* [vim-rainbow][vim-rainbow] -- Rainbow brackets and parenthesis

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

[TPM]: https://github.com/tmux-plugins/tpm
[resurrect]: https://github.com/tmux-plugins/tmux-resurrect
[continuum]: https://github.com/tmux-plugins/tmux-continuum
[yank]: https://github.com/tmux-plugins/tmux-yank
[copycat]: https://github.com/tmux-plugins/tmux-copycat

[Ack]: https://github.com/mileszs/ack.vim.git
[Ale]: https://github.com/w0rp/ale
[asyncrun]: https://github.com/skywind3000/asyncrun.vim
[Autoclose]: https://github.com/Townk/vim-autoclose
[editconfig]: https://github.com/editorconfig/editorconfig-vim
[fzf]: https://github.com/junegunn/fzf.vim
[Fugitive]: https://github.com/tpope/vim-fugitive
[LightLine]: https://github.com/itchyny/lightline.vim
[NerdTree]: https://github.com/scrooloose/nerdtree.git
[SuperTab]: https://github.com/ervandew/supertab]
[TComment]: https://github.com/tomtom/tcomment_vim
[vim-jinja]: https://github.com/mitsuhiko/vim-jinja
[vim-javascript]: https://github.com/pangloss/vim-javascript
[vim-jsx-pretty]: https://github.com/MaxMEllon/vim-jsx-pretty
[vim-rainbow]: https://github.com/frazrepo/vim-rainbow
