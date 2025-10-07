vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use "nvim-lua/plenary.nvim"

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
	        require("nvim-autopairs").setup {}
	    end
    }

    -- Themes and status line
    use 'nvim-tree/nvim-web-devicons'

    use ({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('orion3464.plugins.lualine')
        end
    })

    use({
	    'Mofiqul/dracula.nvim',
	    config = function()
	        require('orion3464.plugins.dracula')
	    end
    })

    use({
	    'rose-pine/neovim',
	    as = 'rose-pine',
	    config = function()
	        require('orion3464.plugins.rose')
	    end
    })

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,

        config = function()
            require('orion3464.plugins.treesitter')
        end
    }

    -- File System Navigation
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },

        config = function()
            require('orion3464.plugins.tree')
        end
    }

    -- Tab management
    use 'lewis6991/gitsigns.nvim'
    use 'romgrk/barbar.nvim'

    -- LSP 
    use {
        'neovim/nvim-lspconfig',
        event = 'BufRead',

        config = function()
            require('orion3464.plugins.lsp.servers')
        end,

        requires = {
                {
                    -- WARN: Unfortunately we won't be able to lazy load this
                    'hrsh7th/cmp-nvim-lsp',
                },
            },
    }

    use({
            'jose-elias-alvarez/null-ls.nvim',
            event = 'BufRead',
--            config = function()
--                require('numToStr.plugins.lsp.null-ls')
--            end,
        })

    use({
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            config = function()
                require('orion3464.plugins.completion')
            end,
            requires = {
                {
                    'L3MON4D3/LuaSnip',
                    event = 'InsertEnter',
--                    config = function()
--                        require('numToStr.plugins.lsp.luasnip')
--                    end,
                    requires = {
                        {
                            'rafamadriz/friendly-snippets',
                            event = 'CursorHold',
                        },
                    },
                },
            },
        },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    })

        -- Git plugins
    use 'NeogitOrg/neogit'
end)
