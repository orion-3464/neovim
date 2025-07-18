local opt = vim.opt

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
