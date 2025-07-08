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
end)
