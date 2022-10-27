print("Config loaded from init.lua")

-- Columns
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'auto'
vim.opt.colorcolumn = '80'

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- System config
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

vim.opt.scrolloff = 4
vim.opt.wrap = false

-- Indentation config (should be auto-detected or come from .editorconfig)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Colors
-- TODO: Not sure if we need this, we're not setting TERM correctly!
vim.opt.termguicolors = true

-- Completion
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

-- Drawing whitespace characters
vim.opt.list = true
vim.opt.listchars = 'tab:>-'

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Faster scroll mappings
vim.keymap.set({'n', 'v', 'x'}, 'J', "5j")
vim.keymap.set({'n', 'v', 'x'}, 'K', "5k")

-- Quickfix mappings
vim.keymap.set({'n', 'v', 'x'}, ']q', ":cn<cr>")
vim.keymap.set({'n', 'v', 'x'}, '[q', ":cp<cr>")

-- TODO: Use function for this so we can use '_q' to toggle quickfix window
vim.keymap.set({'n', 'v', 'x'}, '_q', ":cclose<cr>")

-- For neovide on windows see https://github.com/Kethku/neovide/issues/473
vim.keymap.set({'n', 'v', 'x'}, '<C-6>', '<C-^>')

-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.nvim/plugged')

-- For jumping between camel case words
Plug('bkad/CamelCaseMotion')

-- For easily aligning text
Plug('godlygeek/tabular')

-- For easily commenting and uncommenting lines
Plug('preservim/nerdcommenter')

-- For faster searching with ag from inside vim
Plug('mileszs/ack.vim')

-- For git integration
Plug('tpope/vim-fugitive')

-- For base16 color schemes
Plug('chriskempson/base16-vim')

-- For file browsing inside vim
Plug('nvim-tree/nvim-web-devicons') -- optional, for file icons
Plug('nvim-tree/nvim-tree.lua')

vim.call('plug#end')

-- nvim tree config
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- CamelCaseMotion Config for using ',' as our <leader> mapping
vim.call("camelcasemotion#CreateMotionMappings",',')

-- Ack.vim config
vim.g.ackprg = 'ag --vimgrep'
