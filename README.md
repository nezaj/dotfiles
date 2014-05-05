## Dotfiles
My secret sauce for getting things done.

* [Dependencies](#dependencies)
* [Installing](#installing)
* [Vim Plugins](#vim-plugins)

### Getting Started
#### Dependencies
We need to brew some tools
```
brew install tmux
brew install ack
brew install ctags
```

#### Installing
Clone this repo and run `./setup.sh` to create the symlinks. Now we need the Vim plugins so let's fetch and update them
```
cd ~/dotfiles
git submodule init
git submodule update
```
If you want to add a new plugin use the following command
```
git submodule add [PLUGIN_GIT_REPO] vim/bundle/[PLUGIN_NAME] cat .gitmodules
```
Sweet, we're done!

### Vim Plugins
* [Ack][Ack]
* [Ctrlp][Ctrlp]
* [Fugitive][Fugitive]
* [Lightline][Lightline]
* [NerdTree][NerdTree]
* [Tagbar][Tagbar]
* [TComment][TComment]

[Ack]: https://github.com/mileszs/ack.vim.git
[CtrlP]: https://github.com/kien/ctrlp.vim.git
[Fugitive]: https://github.com/tpope/vim-fugitive
[LightLine]: https://github.com/itchyny/lightline.vim
[NerdTree]: https://github.com/scrooloose/nerdtree.git
[Tagbar]: https://github.com/majutsushi/tagbar.git
[TComment]: https://github.com/tomtom/tcomment_vim
