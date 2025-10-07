local opts = { noremap = true, silent = true }

local function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, opts)
end

-- Buffer navigation

map('n', '[b', ':bprevious<CR>')
map('n', ']b', ':bnext<CR>')
map('n', '[B', ':bfirst<CR>')
map('n', ']B', ':blast<CR>')

-- Mimic shell movements in insert mode
map('i', '<C-E>', '<C-o>$')
map('i', '<C-A>', '<C-o>^')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

