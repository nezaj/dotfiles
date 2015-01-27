## Dotfiles
My secret sauce for getting things done.

* [Dependencies](#dependencies)
* [Vim setup](#vim-setup)
* [Vim plugins](#vim-plugins)

### Dependencies
```
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

And we're done. Huzzah!

### Vim plugins
* [Ack][Ack]
* [Autoclose][Autoclose]
* [Ctrlp][Ctrlp]
* [Emmet-Vim][Emmet-Vim]
* [Fugitive][Fugitive]
* [Lightline][Lightline]
* [Neocomplcache][Neocomplcache]
* [NerdTree][NerdTree]
* [TComment][TComment]
* [vim-jsbeautify][jsbeautify]

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
