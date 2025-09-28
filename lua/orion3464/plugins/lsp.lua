vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')

vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- could be "■", "▎", "x"
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

