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
end)
