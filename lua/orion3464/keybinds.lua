local opts = { noremap = true, silent = true }

local function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, opts)
end


-- Buffer navigation

map('n', '[b', ':bprevious<CR>')
map('n', ']b', ':bnext<CR>')
map('n', '[B', ':bfirst<CR>')
map('n', ']B', ':blast<CR>')

