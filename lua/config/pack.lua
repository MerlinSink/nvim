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
	{ src = "https://github.com/sainnhe/everforest" },

	-- treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- gitsigns
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	-- conform & blink.cmp & luasnip
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.7.0") },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },

	-- nui & plenary & nio & nvim-web-devicons & dressing
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/dressing.nvim" },

	-- snacks & flash & noice & lazydev & which-key
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },

	-- bufferline & lualine & rainbow-delimiters
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/hiphish/rainbow-delimiters.nvim" },

	-- oil & mini
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.move" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },

	-- === tools ===
	-- vim-tmux-navigator & grug-far
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },

	-- === lang ===
	-- c
	{ src = "https://github.com/p00f/clangd_extensions.nvim" },

	-- python
	{ src = "https://github.com/linux-cultist/venv-selector.nvim" },

	-- markdown
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

	-- AI
	{ src = "https://github.com/yetone/avante.nvim" },
	{ src = "https://github.com/Kaiser-Yang/blink-cmp-avante" },
})

-- local hooks = function(ev)
-- 	-- Use available |event-data|
-- 	local name, kind = ev.data.spec.name, ev.data.kind
-- 	-- Run build script after plugin's code has changed
-- 	if name == "avante" and kind == "install" then
-- 		if vim.fn.has("win32") ~= 0 then
-- 			vim.system(
-- 				{ "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" },
-- 				{ cwd = ev.data.path }
-- 			)
-- 		else
-- 			vim.system({ "make" }, { cwd = ev.data.path })
-- 		end
-- 	end
-- 	-- If action relies on code from the plugin (like user command or
-- 	-- Lua code), make sure to explicitly load it first
-- 	-- if name == "plug-2" and kind == "update" then
-- 	-- 	if not ev.data.active then
-- 	-- 		vim.cmd.packadd("plug-2")
-- 	-- 	end
-- 	-- 	vim.cmd("PlugTwoUpdate")
-- 	-- 	require("plug2").after_update()
-- 	-- end
-- end
-- -- If hooks need to run on install, run this before `vim.pack.add()`
-- -- To act on install from lockfile, run before very first `vim.pack.add()`
-- vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })
