" vim:foldmethod=marker:foldlevel=0

" Nezaj's vimrc -- my magic sauce for getting things done!
" -----------------------------------------------------------------------------

" Plug {{{1
"Auto install Plug for neovim
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Language agnostic
Plug 'tpope/vim-fugitive'  " Git Blame and friends
Plug 'https://github.com/scrooloose/nerdtree.git'  " File Explorer
Plug 'https://github.com/tomtom/tcomment_vim'  " Easy commenting
Plug 'mileszs/ack.vim'  " Enable fuzzy-search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Installs fzf for fast fuzzy search
Plug 'junegunn/fzf.vim'  " Fast fuzzy search for vim!
Plug 'https://github.com/itchyny/lightline.vim'  " Pretty status bar
Plug 'https://github.com/editorconfig/editorconfig-vim'  " Respect code style
Plug 'https://github.com/mitsuhiko/vim-jinja'  " Syntax highlighting for jinja
Plug 'https://github.com/nanotech/jellybeans.vim' " colorscheme

" Clojure
Plug 'https://github.com/tpope/vim-fireplace', { 'for': 'clojure', 'commit': '8a4f232e9844d73adb41eb29148f0c046c730f98' } " REPL in vim
Plug 'https://github.com/venantius/vim-cljfmt', { 'for': 'clojure' } " gofmt for clojure
Plug 'https://github.com/clojure-vim/clojure.vim', { 'for': 'clojure' } " syntatx highlighting
Plug 'https://github.com/guns/vim-sexp', {'for': 'clojure' }  " sexp navigation
Plug 'https://github.com/tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure' }  " key-bindings for sexp navigation
Plug 'https://github.com/frazrepo/vim-rainbow', " pretty ((()))
Plug 'https://github.com/craigemery/vim-autotag'  " Code navigation
Plug 'Olical/conjure' " Better Clojure Eval!

" Javascript
Plug 'https://github.com/elzr/vim-json'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
Plug 'https://github.com/prettier/vim-prettier'

" Intellisense
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" Vim settings {{{1
" Important {{{2
set nocompatible                        " Enable Vim features
syntax on                               " Turn on syntax highlighting
let mapleader = ","                     " Set <leader> character
let maplocalleader = ","                " Set <localleader> character
colors jellybeans                       " Favorite so far
set encoding=utf-8                      " Use utf-8 when reading files
set fileencoding=utf-8                  " Files are written using utf-8
set lazyredraw                          " Don't redraw on macros -- boosts performance
set ttyfast                             " Faster redraws and smoother vim
set modelines=1                         " Read the modeline at the top
set signcolumn=yes                      " Show gutter at all times

" Ignore these files in Vim's file explorer {{{2
set wildignore+="/tmp/*,*.so,*.swp,*.zip

" Make clipboard the default register {{{2
set clipboard=unnamed

" Highlight column 81 {{{2
set colorcolumn=81
highlight ColorColumn ctermbg=234

" General {{{2
set autoread                            " Reload files when outside changes made
set backspace=indent,eol,start          " Allow backspace in insert mode
set foldnestmax=2                       " Sets max fold level.
set gcr=a:blinkon0                      " Disable cursor blink
set hidden                              " Buffers can exist in background
set history=1000                        " keep 100 lines of command line history
set laststatus=2                        " lightline needs this to display status when opening first buffer
set noshowmode                          " using Lightline to show status bar instead
set noswapfile                          " Disable swap files. I don't use them
set number                              " Line numbers!
set ruler                               " show the cursor position all the time
set scrolloff=8                         " Start scrolling 8 lines away from bottom
set shortmess+=I                        " Remove Vim startup message for empty file
set showcmd                             " Show incomplete commands at bottom
set showmode                            " Show current mode down the bottom
set splitbelow                          " Default horizontal split below
set splitright                          " Default vertical split right
set visualbell                          " Disable sounds

" Wrap {{{2
set wrap
set linebreak                           " Wrap lines at convienent points
set textwidth=0
set wrapmargin=0

" Searching {{{2
set hlsearch                            " highlight searching
set incsearch                           " do incremental searching
set ignorecase                          " searches are case insensitive
set smartcase                           " unless you search with a capital letter

" Tabs and Spaces {{{2
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Auto adjust window sizes when they become current {{{2
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
" }}} End section

" Key mappings {{{1
" Highlight initials in notes {{{2
:match Todo /JA:/

" Easy Navigating {{{2
:inoremap jk <Esc>
:nnoremap j gj
:nnoremap k gk

" Easy window cycling {{{2
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" Easy save/quit {{{2
:noremap <leader>w :w<CR>
:nnoremap <leader>q :q!<CR>
:nnoremap <leader>zz :qa!<CR>


" Reload vimrc file {{{2
:nnoremap <silent><leader>sv :so $MYVIMRC<CR>

" Edit useful files {{{2
:nnoremap <silent><leader>ev :e $MYVIMRC<CR>
:nnoremap <silent><leader>et :e $MYTMUXCONF<CR>
:nnoremap <silent><leader>ez :e $MYZSH<CR>
:nnoremap <silent><leader>ep :e $MYPROFILE<CR>
:nnoremap <silent><leader>ed :e $MYTODOS<CR>

" Clear search {{{2
:nnoremap <silent><leader>/ :nohlsearch<CR>

" Easy command Mode {{{2
:nnoremap ; :

" Easy begin/end line navigation {{{2
:nnoremap H 0w
:nnoremap L $

" Easy clipboard copy {{{2
:vnoremap <silent><leader>c :w !pbcopy<CR><CR>

" Easy clipboard paste {{{2
:nnoremap <silent><leader>v :r !pbpaste<CR><CR>

" Reformat tabs/spaces {{{2
:nmap <silent><leader>R gg=G

" Easy code folding {{{2
:nnoremap <Space> za

" Quick newline {{{2
:nnoremap <CR> o<Esc>

" Toggle NERDTree {{{2
:nnoremap <leader>nt :NERDTree<CR>

"
" Toggle show formatting {{{2
:nnoremap <leader>l :set list!<CR>

" Window manipulation {{{2
:nnoremap <leader>\ :vsp<CR>
:nnoremap <leader>m :vertical resize 80<CR>

" Fugitive shortcuts {{{2
:nnoremap <leader>gb :Git blame<CR>

" Tab switching {{{2
:nnoremap <leader>1 1gt
:nnoremap <leader>2 2gt
:nnoremap <leader>3 3gt
:nnoremap <leader>4 4gt
:nnoremap <leader>5 5gt
:nnoremap <leader>6 6gt
:nnoremap <leader>7 7gt
:nnoremap <leader>8 8gt
:nnoremap <leader>9 9gt
:nnoremap <leader>0 :tablast<CR>
:nnoremap <leader>x :tabclose<CR>
:nnoremap <leader>t :0tabnew<CR>

" Easy fzf {{{2
nmap ; :Buffers<CR>
nmap <leader>p :Files<CR>

" Toggle paste mode {{{2
:nnoremap <leader>P :set invpaste!<CR>

" Ctags navigation {{{2
:nnoremap <leader>g <C-]>
:nnoremap <leader>b <C-t>

" Easy Ack/Ag {{{2
:nnoremap <leader>a :Ack!<Space>

" Quick Search {{{2
:nnoremap <silent><leader>f :Ack!<CR>

" Easy commenting {{{2
:nnoremap // :TComment<CR>
:vnoremap // :TComment<CR>

" Prevent overwriting default register (system clipboard) when inconvenient {{{2
:vnoremap x "_x
:vnoremap c "_c
:vnoremap p "_dP

" Don't use arrow keys in normal mode :) {{{2
:nnoremap <Left>  <NOP>
:nnoremap <Right> <NOP>
:nnoremap <Up>    <NOP>
:nnoremap <Down>  <NOP>

" In insert or command mode, move normally by using Ctrl {{{2
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Easy word swap {{{2
:nnoremap <w dawbhPb
:nnoremap >w hdeepb

" Enables filetype detection and loads indent files {{{2
" Note: It's important this called after vim/bundle is added to vim's
" runtime path so that ftdetect will be loaded
" Thanks:  http://stackoverflow.com/a/19314347
filetype plugin indent on

" Set path for fzf
set rtp+=/usr/local/opt/fzf

" Plugins {{{1

" CoC {{{2
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-prettier', 'coc-eslint', '@yaegassy/coc-tailwindcss3', 'coc-clojure']

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Remove plugins not explicitly defined in g:coc_global_extensions
" Ignore special case: friendly-snippets
function! CocClean() abort
  let g:extensions_to_clean = CocAction("loadedExtensions")
      \ ->filter({idx, extension -> extension !~ 'friendly-snippets'})
      \ ->filter({idx, extension -> index(g:coc_global_extensions, extension) == -1})
  if len(g:extensions_to_clean)
    exe 'CocUninstall' join(map(g:extensions_to_clean, {_, line -> split(line)[0]}))
  else
    echo 'Nothing to clean'
  endif
endfunction
command! -nargs=0 CocClean :call CocClean()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Ack {{{2

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the word the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Lightline {{{2
" General settings
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive'
    \ },
    \ 'separator': { 'left': "", 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

" NERDTree {{{2
" Files and directories I don't want to see
" Note the use of vim-style regex
let NERDTreeIgnore = [
            \ '\.\(pyc\|swp\|db\|coverage\|DS_Store\)$',
            \ '\.\(git\|hg\|svn\|egg-info\)$[[dir]]',
            \ '\(coverage\|pytests\)\.xml$',
            \ ]

" I do want to see dotfiles (like .gitignore)
let NERDTreeShowHidden=1

" Pretty NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vim-javascript {{{2

" vim-jsx-pretty {{{2
" Colorful style
let g:vim_jsx_pretty_colorful_config = 1

" vim-prettier {{{2
" Run prettier async
let g:prettier#exec_cmd_async = 1

" Custom functions {{{1
" Strip whitespace and save cursor position {{{2
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Displays current git branch in powerline {{{2
function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*FugitiveHead")
    let _ = FugitiveHead()
    return strlen(_) ? "\u00A7 "._ : ''
  endif
  return ''
endfunction

" Autocommands {{{1
augroup configgroup
    " Clear previous autocmds
    autocmd!

    " White Space Settings for different file types {{{2
    autocmd FileType python setlocal ts=4 sts=4 sw=4 et
    autocmd FileType javascript,jsx,tsx,typescriptreact,json setlocal ts=2 sts=2 sw=2 et
    autocmd FileType css setlocal ts=2 sts=2 sw=2 et
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
    autocmd FileType html,htmljinja setlocal ts=2 sts=2 sw=2 et

    " Clean up trailing white spaces {{{2
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    " Python folding {{{2
    au FileType python setlocal foldmethod=indent
    au FileType python setlocal foldlevel=0

    " Clojure evaluate block {{{2
    au BufEnter *.cljs,*.clj,*.cljs.hl nmap cpb :Eval<CR>

    " Rainbow-ify parens/brackets for selected file types {{{2
    au FileType javascriptreact,jsx call rainbow#load()

    " Save whenever switching between windows and buffers {{{2
    au FocusLost,BufLeave,WinLeave * :silent! w

    " Run prettier async on save for front-end files
    au BufWrite *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" }}} End section

augroup END
