vim.pack.add({
	-- lspconfig & mason
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },

	-- dap
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },

	-- colorscheme
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },

	-- treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- gitsigns
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- multicursor
	{ src = "https://github.com/jake-stewart/multicursor.nvim" },

	-- conform & blink.cmp & luasnip
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.compat" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.7.0") },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },

	-- nui & plenary & nio & nvim-web-devicons
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	-- snacks & flash & noice & lazydev & which-key
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },

	-- bufferline & lualine
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },

	-- oil & mini
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.move" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },

	-- c
	{ src = "https://github.com/p00f/clangd_extensions.nvim" },

	-- python
	{ src = "https://github.com/linux-cultist/venv-selector.nvim" },

	-- markdown
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})
