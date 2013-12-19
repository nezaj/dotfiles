# Installation:
    git clone git://github.com/nezaj/dotfiles.git ~/dotfiles

### Create symlinks:
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vim/vimrc ~/.vimrc
    rm -rf ~/.bash_profile
    rm ~/.bashrc
    rm ~/.gitconfig
    ln -s ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/dotfiles/.bashrc ~/.bashrc
    ln -s ~/dotfiles/.gitconfig ~/.gitconfig

### Switch to the `~/.vim` directory, and fetch submodules:
    cd ~/dotfiles
    git submodule init
    git submodule update

### Install Tools
* [Install Ack][0]
* [Install Ctags][1]

# Updating:
    git pull
    git submodules init
    git submodules update

# Adding new vim plugins:
    git submodule add [PLUGIN_GIT_REPO] vim/bundle/[PLUGIN_NAME] cat .gitmodules

# Current Plugins
* [Ack]
* [Ctrlp]
* [Fugitive]
* [Lightline]
* [NerdTree]
* [Tagbar]

[0]: http://beyondgrep.com/install/
[1]: http://ctags.sourceforge.net/
[Ack]: https://github.com/mileszs/ack.vim.git
[CtrlP]: https://github.com/kien/ctrlp.vim.git
[Fugitive]: https://github.com/tpope/vim-fugitive
[LightLine]: https://github.com/itchyny/lightline.vim
[NerdTree]: https://github.com/scrooloose/nerdtree.git
[Tagbar]: https://github.com/majutsushi/tagbar.git
