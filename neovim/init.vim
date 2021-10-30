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
set list
set listchars=tab:>-

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

" Godot syntax highlighting
Plug 'habamax/vim-godot'

" Nerd commenter
Plug 'preservim/nerdcommenter'

" GLSL syntax highlighting
Plug 'tikhomirov/vim-glsl'

call plug#end()

" Clang format Config
autocmd FileType c,cpp,h,cc,hpp vnoremap <leader>f :ClangFormat<cr>

" CamelCaseMotion Config
call camelcasemotion#CreateMotionMappings(',')

" Make bindings
" TODO: Want per project makeprg
if has('win32')
    set makeprg=build.bat
    set guifont=Iosevka\ NF:h16
else
    set makeprg=./build.sh
endif
noremap <F6> :Make<cr>

" Yank and paste from the system clipboard
set clipboard=unnamedplus

noremap ]q :cn<cr>
noremap [q :cp<cr>

" For neovide on windows see https://github.com/Kethku/neovide/issues/473
noremap <C-6> <C-^>
