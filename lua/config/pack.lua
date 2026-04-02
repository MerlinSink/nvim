vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
}, {
	load = function(plug_data)
		vim.api.nvim_create_autocmd("UIEnter", {
			once = true,
			callback = function()
				vim.cmd.packadd(plug_data.spec.name)
				local name = plug_data.spec.name:gsub("%.nvim$", "")
				local ok = pcall(require, name)
				if ok and name ~= "flash" then
					require("plugins." .. name)
				end
			end,
		})
	end,
})

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/hiphish/rainbow-delimiters.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
}, {
	load = function(plug_data)
		vim.api.nvim_create_autocmd({ "BufReadPre", "BufReadPost" }, {
			once = true,
			callback = function()
				vim.cmd.packadd(plug_data.spec.name)
				local name = plug_data.spec.name:gsub("%.nvim$", "")
				local ok = pcall(require, name)
				if ok and name ~= "nvim-lspconfig" then
					require("plugins." .. name)
				end
			end,
		})
	end,
})

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
}, {
	load = function(plug_data)
		vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
			once = true,
			callback = function()
				vim.cmd.packadd(plug_data.spec.name)
				require("plugins.blink")
			end,
		})
	end,
})

vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
})

-- TreeSitter
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
			require("plugins.treesitter")
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/Kaiser-Yang/blink-cmp-avante" },
	{ src = "https://github.com/yetone/avante.nvim" },
}, {
	load = function(plug_data)
		vim.api.nvim_create_autocmd({ "BufReadPre", "BufReadPost" }, {
			once = true,
			callback = function()
				vim.cmd.packadd(plug_data.spec.name)
				local ok = pcall(require, "avante")
				if ok then
					require("plugins.avante")
				end
			end,
		})
	end,
})

-- nui & plenary & nio & nvim-web-devicons & dressing
vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/dressing.nvim" },
})

vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim" },

	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.move" },


	-- === tools ===
	-- vim-tmux-navigator & grug-far
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },

	-- markdown
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

-- FileType
vim.pack.add({
	{ src = "https://github.com/linux-cultist/venv-selector.nvim" },
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
-- 	if name == "plug-2" and kind == "update" then
-- 		if not ev.data.active then
-- 			vim.cmd.packadd("plug-2")
-- 		end
-- 		vim.cmd("PlugTwoUpdate")
-- 		require("plug2").after_update()
-- 	end
-- end
-- -- If hooks need to run on install, run this before `vim.pack.add()`
-- -- To act on install from lockfile, run before very first `vim.pack.add()`
-- vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })
