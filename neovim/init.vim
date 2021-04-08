set guicursor
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=no

noremap J 5j
noremap K 5k

set splitright
set splitbelow

" Plugins
call plug#begin('~/.vim/plugged')

" For C++ code formatting
Plug 'rhysd/vim-clang-format'

" CamelCaseMotion
Plug 'bkad/CamelCaseMotion'

" Vim Dispatch
Plug 'tpope/vim-dispatch'

" Tabular
Plug 'godlygeek/tabular'

call plug#end()

" Clang format Config
autocmd FileType c,cpp,h,cc,hpp vnoremap <leader>f :ClangFormat<cr>

" CamelCaseMotion Config
call camelcasemotion#CreateMotionMappings(',')

" Make bindings
" TODO: Want per project makeprg
set makeprg=./build.sh
noremap <F6> :Make<cr>

" Yank and paste from the system clipboard
set clipboard=unnamedplus
