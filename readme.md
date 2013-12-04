# Installation:
    git clone git://github.com/nezaj/dotfiles.git ~/dotfiles

### Create symlinks:
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vim/vimrc ~/.vimrc

### Switch to the `~/.vim` directory, and fetch submodules:
    cd ~/.vim
    git submodule init
    git submodule update

# Updating:
    git pull
    git submodules init
    git submodules update

# Adding new plugins:
    git submodule add [PLUGIN_GIT_REPO] bundle/[PLUGIN_NAME]
    cat .gitmodules
