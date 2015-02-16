" Unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

"===================================
" PLUGIN MANAGER
"===================================
set nocompatible
filetype off

" use the vimfiles directory instead of .vim for storing plugins if windows.
if has("win32") || has("win16")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif

Plugin 'gmarik/vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'nanotech/jellybeans.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'tpope/vim-dispatch'

call vundle#end()
filetype plugin on
filetype plugin indent on

"===================================
" COLOURS
"===================================
set background=dark
color jellybeans
syntax enable " enable syntax processing.

"===================================
" SPACES AND TABS
"===================================
set tabstop=2 " number of spaces per TAB.
set shiftwidth=2 " number of spaces used when indenting text.
set softtabstop=0 " number o spaces inserted when inserting TAB.
set expandtab       " always convert tabs to spaces.
set smarttab

"===================================
" UI
"===================================
set number " show line numbers.
set cursorline " highlights the current line.
set wildmenu " visual autocomplete for command menu.
set showmatch " highlights matching [{()}]
set laststatus=2 " last window always has a status line.
set nowrap " disables text wrapping.

" highlights the 80th column.
if ( exists( '+colorcolumn' ) )
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" hides all of the extra UI in GVim.
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

"===================================
" SEARCHING
"===================================
set incsearch " search as characters are entered.
set tags=./tags,tags,.tags " acceptable names for tag files.

"===================================
" VIM-AIRLINE PLUGIN
"===================================
"vim-airline
let g:airline#extensions#tabline#enabled = 1 "Enable the list of buffers.
let g:airline#extensions#tabline#fnamemode = ':t' "Show just the filename.

"===================================
" CTRL-P PLUGIN
"===================================
"CtrlP config from
"https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"===================================
" BUFFERGATOR PLUGIN
"===================================
"Buffergator config from
"https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'L'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<r>

"===================================
" WINDOWS SPECIFIC
"===================================
if has("win32") || has("win16")
  set guifont=Droid\ Sans\ Mono:h10
  set backspace=2
endif
