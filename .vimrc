" Unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

set nocompatible

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'shawncplus/skittles_berry'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin on
filetype plugin indent on
set number
syntax enable
set background=dark
color jellybeans
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=0

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

set laststatus=2
set nowrap
set linebreak
set cursorline
set tags=./tags,tags,.tags

"Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_lua_checkers = [ "luac" ]
let g:syntastic_luacheck_args = "--no-unused-args"

"vim-airline
let g:airline#extensions#tabline#enabled = 1 "Enable the list of buffers.
let g:airline#extensions#tabline#fnamemode = ':t' "Show just the filename.

"CtrlP config from https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
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

"Buffergator config from https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
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
