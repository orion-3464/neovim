-- Buffer navigation

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '[b', ':bprevious<CR>', opts)
vim.keymap.set('n', ']b', ':bnext<CR>', opts)
vim.keymap.set('n', '[B', ':bfirst<CR>', opts)
vim.keymap.set('n', ']B', ':blast<CR>', opts)
