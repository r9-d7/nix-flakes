-- nvim/lua/pluginlist.lua
return {
    -- colorscheme; tokyonight theme
    {
        "folke/tokyonight.nvim",
	priority = 1000,
	config = function()
	    vim.cmd("colorscheme tokyonight")
	end
    },

    -- plugin for commenting out lines of code
    {
        "numToStr/Comment.nvim",
	config = function()
	    require("Comment").setup()
        end
    },

    -- lualine plugin
    {
        'nvim-lualine/lualine.nvim',
	dependencies = {
	    "nvim-tree/nvim-web-devicons"
	},
	config = function()
	    require("lualine").setup({
	        icons_enabled = true,
		theme = 'tokyonight',
	    })
	end
    },

    -- other plugins
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",

    {
	'hrsh7th/nvim-cmp',
	dependencies = {
	    'L3M0N4D3/LuaSnip',
	    'saadparwaiz1/cmp_luasnip',
	    'rafamadriz/friendly-snippets',

	    'hrsh7th/cmp-nvim-lsp',
        },
    },

    {
	'nvim-telescope/telescope-fzf-native.nvim',
	build = 'make',
    },
    
    {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
    }
}
