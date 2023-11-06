" vim:foldmethod=marker:foldlevel=0

" Nezaj's vimrc -- my magic sauce for getting things done!
" -----------------------------------------------------------------------------

" Plug 
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
Plug 'Olical/conjure', {'branch': 'develop', 'for': 'clojure'}  " Better Clojure eval!
Plug 'NoahTheDuke/coc-clojure', {'for': ['clojure']}  " clojure code-completion
Plug 'guns/vim-clojure-highlight', {'for': ['clojure']}  " syntax highlight
Plug 'https://github.com/venantius/vim-cljfmt', { 'for': 'clojure' } " gofmt for clojure
Plug 'https://github.com/frazrepo/vim-rainbow' " pretty ((()))
Plug 'https://github.com/craigemery/vim-autotag'  " Code navigation
Plug 'https://github.com/guns/vim-sexp', {'for': 'clojure' }  " sexp navigation
Plug 'https://github.com/tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure' }  " key-bindings for sexp navigation
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }  " I'm only using this for auto-format right now...

" Javascript
Plug 'https://github.com/elzr/vim-json'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
Plug 'https://github.com/prettier/vim-prettier'

" Intellisense
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}  " coc fzf

" Initialize plugin system
call plug#end()

" Vim settings 
" Important 
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

" Ignore these files in Vim's file explorer 
set wildignore+="/tmp/*,*.so,*.swp,*.zip

" Make clipboard the default register 
set clipboard=unnamed

" Highlight column 81 
set colorcolumn=81
highlight ColorColumn ctermbg=234

" General 
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

" Wrap 
set wrap
set linebreak                           " Wrap lines at convienent points
set textwidth=0
set wrapmargin=0

" Searching 
set hlsearch                            " highlight searching
set incsearch                           " do incremental searching
set ignorecase                          " searches are case insensitive
set smartcase                           " unless you search with a capital letter

" Tabs and Spaces 
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Auto adjust window sizes when they become current 
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
"  End section

" Key mappings 
" Highlight initials in notes 
:match Todo /JA:/

" Easy Navigating 
:inoremap jk <Esc>
:nnoremap j gj
:nnoremap k gk

" Easy window cycling 
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" Easy save/quit 
:noremap <leader>w :w<CR>
:nnoremap <leader>q :q!<CR>
:nnoremap <leader>zz :qa!<CR>


" Reload vimrc file 
:nnoremap <silent><leader>sv :so $MYVIMRC<CR>

" Edit useful files 
:nnoremap <silent><leader>ev :e $MYVIMRC<CR>
:nnoremap <silent><leader>et :e $MYTMUXCONF<CR>
:nnoremap <silent><leader>ez :e $MYZSH<CR>
:nnoremap <silent><leader>ep :e $MYPROFILE<CR>
:nnoremap <silent><leader>ed :e $MYTODOS<CR>

" Clear search 
:nnoremap <silent><leader>/ :nohlsearch<CR>

" Easy command Mode 
:nnoremap ; :

" Easy begin/end line navigation 
:nnoremap H 0w
:nnoremap L $

" Easy clipboard copy 
:vnoremap <silent><leader>c :w !pbcopy<CR><CR>

" Easy clipboard paste 
:nnoremap <silent><leader>v :r !pbpaste<CR><CR>

" Reformat tabs/spaces 
:nmap <silent><leader>R gg=G

" Easy code folding 
:nnoremap <Space> za

" Quick newline 
:nnoremap <CR> o<Esc>

" Toggle NERDTree 
:nnoremap <leader>nt :NERDTree<CR>

"
" Toggle show formatting 
:nnoremap <leader>l :set list!<CR>

" Window manipulation 
:nnoremap <leader>\ :vsp<CR>
:nnoremap <leader>m :vertical resize 80<CR>

" Fugitive shortcuts 
:nnoremap <leader>gb :Git blame<CR>

" Tab switching 
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

" Easy fzf 
nmap ; :Buffers<CR>
nmap <leader>p :Files<CR>

" Toggle paste mode 
:nnoremap <leader>P :set invpaste!<CR>

" Ctags navigation 
:nnoremap <leader>g <C-]>
:nnoremap <leader>b <C-t>

" Easy Ack/Ag 
:nnoremap <leader>a :Ack!<Space>

" Quick Search 
:nnoremap <silent><leader>f :Ack!<CR>

" Easy commenting 
:nnoremap // :TComment<CR>
:vnoremap // :TComment<CR>

" Prevent overwriting default register (system clipboard) when inconvenient 
:vnoremap x "_x
:vnoremap c "_c
:vnoremap p "_dP

" Don't use arrow keys in normal mode :) 
:nnoremap <Left>  <NOP>
:nnoremap <Right> <NOP>
:nnoremap <Up>    <NOP>
:nnoremap <Down>  <NOP>

" In insert or command mode, move normally by using Ctrl 
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Easy word swap 
:nnoremap <w dawbhPb
:nnoremap >w hdeepb

" Enables filetype detection and loads indent files 
" Note: It's important this called after vim/bundle is added to vim's
" runtime path so that ftdetect will be loaded
" Thanks:  http://stackoverflow.com/a/19314347
filetype plugin indent on

" Set path for fzf
set rtp+=/usr/local/opt/fzf

" Plugins 

" CoC b
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-prettier', 'coc-eslint', '@yaegassy/coc-tailwindcss3']

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

" Autcomplete on enter
inoremap <silent> <expr><cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

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

" Ack 

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

" Lightline 
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

" NERDTree 
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

" vim-javascript 

" vim-jsx-pretty 
" Colorful style
let g:vim_jsx_pretty_colorful_config = 1

" vim-prettier 
" Run prettier async
let g:prettier#exec_cmd_async = 1

" Custom functions 
" Strip whitespace and save cursor position 
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

" Displays current git branch in powerline 
function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*FugitiveHead")
    let _ = FugitiveHead()
    return strlen(_) ? "\u00A7 "._ : ''
  endif
  return ''
endfunction


function! ClojureFoldText()
    let nl = v:foldend - v:foldstart + 1
    let comment = getline(v:foldstart+1)
    let txt = comment . ' (lines ' . nl . ')'
    return txt
endfunction

function! ClojureFoldMarker()
   let thisline = getline(v:lnum)
   if match(thisline, '^;; ---') >= 0
      return ">1"
   else
      return "="
   endif
endfunction

" Autocommands 
augroup configgroup
    " Clear previous autocmds
    autocmd!

    " White Space Settings for different file types 
    autocmd FileType python setlocal ts=4 sts=4 sw=4 et
    autocmd FileType javascript,jsx,tsx,typescriptreact,typescript,json setlocal ts=2 sts=2 sw=2 et
    autocmd FileType css setlocal ts=2 sts=2 sw=2 et
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
    autocmd FileType html,htmljinja setlocal ts=2 sts=2 sw=2 et

    " Wrap settings
    autocmd FileType cljc wrapmargin=80 " wrap on conjure help logs

    " Clean up trailing white spaces 
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    " Python folding 
    au FileType python setlocal foldmethod=indent
    au FileType python setlocal foldlevel=0

    " Clojure evaluate block 
    au BufEnter *.cljs,*.clj,*.cljs.hl nmap cpb :Eval<CR>

    " Rainbow-ify parens/brackets for selected file types 
    au FileType javascriptreact,jsx call rainbow#load()

    " Save whenever switching between windows and buffers 
    au FocusLost,BufLeave,WinLeave * :silent! w

    " Run prettier async on save for front-end files
    au BufWrite *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

"  End section

augroup END
