-- =========================
-- LSP Configuration (nvim 0.11+)
-- =========================

-- Add nvim-cmp LSP capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function
local on_attach = function(client, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }

    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)

    -- Highlight symbol under cursor
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
    })
end

-- =========================
-- Enable simple LSP servers (lua_ls, pyright, etc.)
-- =========================
local simple_servers = { "lua_ls", "pyright" }

for _, server in ipairs(simple_servers) do
    vim.lsp.enable({ server }, {
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

-- =========================
-- clangd setup (custom)
-- =========================
local clangd_config = {
    name = "clangd",
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
    },
}

-- Auto-start clangd for C/C++ buffers if not already running
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
    callback = function()
        local clients = vim.lsp.get_clients({ name = "clangd" })
        if #clients == 0 then
            vim.lsp.start(clangd_config)
        end
    end,
})

-- =========================
-- Diagnostic configuration
-- =========================
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 2,
        source = "if_many",
    },
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Floating window borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
)

