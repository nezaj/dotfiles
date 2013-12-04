# Installation:
    git clone git://github.com/nezaj/dotfiles.git ~/dotfiles

### Create symlinks:
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vim/vimrc ~/.vimrc
    rm -rf ~/.bash_profile
    rm ~/.bashrc
    ln -s ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/dotfiles/.bashrc ~/.bashrc

### Switch to the `~/.vim` directory, and fetch submodules:
    cd ~/dotfiles
    git submodule init
    git submodule update

### If you want Ack the plugin: [Install Ack](http://beyondgrep.com/install/)

# Updating:
    git pull
    git submodules init
    git submodules update

# Adding new vim plugins:
    git submodule add [PLUGIN_GIT_REPO] vim/bundle/[PLUGIN_NAME]
    cat .gitmodules
