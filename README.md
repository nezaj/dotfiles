## Dotfiles
My secret sauce for getting things done.

* [Dependencies](#dependencies)
* [Vim setup](#vim-setup)
* [Vim plugins](#vim-plugins)

### Dependencies
```
brew install reattach-to-user-namespace
brew install tmux
brew install ack
```

### Vim setup
1. Clone this repo.
2. Create symlinks with `./setup.sh`
3. Fetch and update vim plugins
```
cd ~/dotfiles
git submodule init
git submodule update
```

### Python setup
```
brew install python
pip install virtualenv
pip install virtualenvwrapper
```

And we're done. Huzzah!

### Vim plugins
* [Ack][Ack] -- Grep across project directory
* [Autoclose][Autoclose] -- Autoclose parenthesis, curly braces, etc.
* [Ctrlp][Ctrlp] -- Fuzzy file searching across project directory
* [Emmet-Vim][Emmet-Vim] -- Generate html fast
* [Fugitive][Fugitive]  -- Git wrapper inside Vim, I only use this for Gblame
* [Lightline][Lightline] -- Like PowerLine but no need to download special fonts
* [Neocomplcache][Neocomplcache] -- Awesome autocomplete plugin
* [NerdTree][NerdTree] -- File directory browser
* [TComment][TComment] -- Comment code super easily
* [vim-jsbeautify][jsbeautify] -- Beautify html, css, and js

If you want to add a new plugin use the following command
```
git submodule add [PLUGIN_GIT_REPO] vim/bundle/[PLUGIN_NAME] cat .gitmodules
```

[Ack]: https://github.com/mileszs/ack.vim.git
[Autoclose]: https://github.com/Townk/vim-autoclose
[CtrlP]: https://github.com/kien/ctrlp.vim.git
[Emmet-Vim]: https://github.com/mattn/emmet-vim
[Fugitive]: https://github.com/tpope/vim-fugitive
[LightLine]: https://github.com/itchyny/lightline.vim
[Neocomplcache]: https://github.com/Shougo/neocomplcache.vim
[NerdTree]: https://github.com/scrooloose/nerdtree.git
[TComment]: https://github.com/tomtom/tcomment_vim
[jsbeautify]: https://github.com/maksimr/vim-jsbeautify
