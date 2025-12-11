vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.signcolumn = 'no'
vim.opt.showmode = false
vim.o.cmdheight = 0
vim.opt.shortmess:append('I')

-- lsp servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('cssls')
vim.lsp.enable('cssmodules_ls')
vim.lsp.enable('docker_language_server')
vim.lsp.enable('docker_compose_language_service')
vim.lsp.enable('sqlls')
vim.lsp.enable('html')
vim.lsp.enable('nextls')
vim.lsp.enable('html')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('jsonls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('yamlls')
vim.lsp.enable('prismals')
vim.lsp.enable('emmet_language_server')

-- Or, to use actual tab characters:
-- vim.opt.expandtab = false
-- bread's neovim config
-- keymaps are in lua/config/mappings.lua
-- install a patched font & ensure your terminal supports glyphs
-- enjoy :D

-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
  vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.o.runtimepath = vim.o.runtimepath
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.cmd('colorscheme ayu')
vim.g.start_time = vim.fn.reltime()
vim.loader.enable() --  SPEEEEEEEEEEED 

vim.call('plug#begin')

-- Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })       --colorscheme
-- Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' }) --colorscheme 2
Plug('nvim-lualine/lualine.nvim') --statusline
Plug('nvim-tree/nvim-web-devicons') --pretty icons
Plug('folke/which-key.nvim') --mappings popup
Plug('romgrk/barbar.nvim') --bufferline
Plug('goolord/alpha-nvim') --pretty startup
Plug('nvim-treesitter/nvim-treesitter') --improved syntax
Plug('mfussenegger/nvim-lint') --async linter
Plug('nvim-tree/nvim-tree.lua') --file explorer
Plug('windwp/nvim-autopairs') --autopairs
-- Plug('norcalli/nvim-colorizer.lua') --color highlight
-- Plug('ibhagwan/fzf-lua') --fuzzy finder and grep

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
-- Plug('SirVer/ultisnips') -- лагает с этой хуйней
-- Plug('mlaursen/vim-react-snippets') -- этой тоже
Plug('nvimtools/none-ls.nvim')

-- LSP
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')
Plug('mfussenegger/nvim-lint')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

vim.call('plug#end')

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
  capabilities = capabilities,
})

require('mason').setup()
require('mason-lspconfig').setup()

-- move config and plugin config to alternate files
require('config.mappings')
require('config.autocmd')

require('plugins.alpha')
require('plugins.autopairs')
require('plugins.barbar')
-- require('plugins.fzf-lua')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.which-key')
require('plugins.nvim-lint')
require('plugins.nvim-cmp')
require('plugins.none-ls')

vim.defer_fn(function()
  -- defer non-essential configs,
  -- purely for experimental purposes:
  -- this only makes a difference of +-10ms on initial startup
  require('plugins.autopairs')
  -- require('plugins.fzf-lua')
  require('plugins.nvim-tree')
  require('plugins.treesitter')
  require('plugins.which-key')
end, 100)
