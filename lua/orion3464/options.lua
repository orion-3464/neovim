local opt = vim.opt
local g = vim.g

-- Editor UI options
opt.number = true
opt.numberwidth = 5
opt.relativenumber = true
opt.cursorline = true

-- Indentation options
opt.shiftwidth = 0
opt.smarttab = true
opt.expandtab = true
opt.cindent = true
opt.tabstop = 4
opt.textwidth = 300
opt.softtabstop = -1

-- Scrolling options
opt.scrolloff = 10
opt.wrap = false

-- Search options
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.timeoutlen = 500
opt.updatetime = 200

opt.history = 100
opt.clipboard = 'unnamedplus'

-- Language options
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = '~/.venvs/nvim/bin/python3'
vim.g.loaded_perl_provider = 0


-- Map leader to SPACE
g.mapleader = ' '
g.maplocalleader = ' '
