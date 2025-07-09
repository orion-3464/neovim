vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

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

end)
