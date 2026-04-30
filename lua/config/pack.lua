vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/stevearc/dressing.nvim" },

	-- lsp
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	-- UI
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/hiphish/rainbow-delimiters.nvim" },

	-- editor
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },

	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/kevinhwang91/promise-async" },
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	-- dap
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },

	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim" },

	-- mini
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.move" },

	-- AI
	{ src = "https://github.com/Kaiser-Yang/blink-cmp-avante" },
	{ src = "https://github.com/yetone/avante.nvim" },

	-- === tools ===
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },

	-- === langurage ===
	-- markdown
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

	-- python
	{ src = "https://github.com/linux-cultist/venv-selector.nvim" },
})

local function get_plugin_names(arg_lead)
	local installed = vim.pack.get(nil, { info = false })
	local names = {}
	for _, p in ipairs(installed) do
		local name = p.spec.name
		if name:lower():find(arg_lead:lower(), 1, true) == 1 then
			table.insert(names, name)
		end
	end
	table.sort(names)
	return names
end

-- :PackUpdate
vim.api.nvim_create_user_command("PackUpdate", function(opts)
	local targets = #opts.fargs > 0 and opts.fargs or nil
	local force = opts.bang
	if targets then
		vim.notify("Checking updates for: " .. table.concat(targets, ", "), vim.log.levels.INFO)
	else
		vim.notify("Checking updates for all plugins...", vim.log.levels.INFO)
	end
	vim.pack.update(targets, { force = force })
end, {
	nargs = "*",
	bang = true,
	complete = get_plugin_names,
	desc = "Update plugins (use ! to skip confirmation)",
})

-- :PackStatus
vim.api.nvim_create_user_command("PackStatus", function(opts)
	local targets = #opts.fargs > 0 and opts.fargs or nil
	vim.pack.update(targets, { offline = true })
end, {
	nargs = "*",
	complete = get_plugin_names,
	desc = "Check plugin status without downloading",
})

local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins"
if vim.fn.isdirectory(plugins_path) == 1 then
	for name, type in vim.fs.dir(plugins_path) do
		if type == "file" and name:match("%.lua$") then
			pcall(require, "plugins." .. name:gsub("%.lua$", ""))
		end
	end
end
