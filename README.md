## Toolkit
* [Vim][1]
* [Tmux][2]
* [Ack][3]
* [Ctags][4]

## Setup (For Mac)
Let's brew some tools
```
brew install tmux
brew install ack
brew install ctags
```
Now clone the repo
```
git clone git://github.com/nezaj/dotfiles.git ~/dotfiles
```
Great, now we have a dotfiles folder in our home directory. Let's create some symlinks to hook things up.
```
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
rm -rf ~/.bash_profile
rm ~/.bashrc
rm ~/.gitconfig
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.ackrc ~/.ackrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore
```
We still need our vim plugins so let's fetch and update them
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
## Current Vim Plugins
* [Ack]
* [Ctrlp]
* [Fugitive]
* [Lightline]
* [NerdTree]
* [Tagbar]
* [TComment]

[1]: http://www.vim.org/
[2]: http://tmux.sourceforge.net/
[3]: http://beyondgrep.com/
[4]: http://ctags.sourceforge.net/
[Ack]: https://github.com/mileszs/ack.vim.git
[CtrlP]: https://github.com/kien/ctrlp.vim.git
[Fugitive]: https://github.com/tpope/vim-fugitive
[LightLine]: https://github.com/itchyny/lightline.vim
[NerdTree]: https://github.com/scrooloose/nerdtree.git
[Tagbar]: https://github.com/majutsushi/tagbar.git
[TComment]: https://github.com/tomtom/tcomment_vim
