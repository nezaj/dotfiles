" vim:foldmethod=marker:foldlevel=0

" Nezaj's vimrc -- my magic sauce for getting things done!
" -----------------------------------------------------------------------------

" Plug {{{1
"Auto install Plug for neovim
if empty(glob('~/.nvim/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Source vimrc
:source ~/.vimrc
