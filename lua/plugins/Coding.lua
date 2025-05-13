return {
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		cmd = "LazyDev",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				-- { path = "LazyVim", words = { "LazyVim" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				-- { path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},

	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		},
	},

	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			}
		end,
	},

	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
		keys = function(_, keys)
			-- Populate the keys based on the user's options
			local opts = require("lazy.core.config").plugins["mini.surround"].opts
			if opts ~= nil then
				local mappings = {
					{ opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
					{ opts.mappings.delete, desc = "Delete Surrounding" },
					{ opts.mappings.find, desc = "Find Right Surrounding" },
					{ opts.mappings.find_left, desc = "Find Left Surrounding" },
					{ opts.mappings.highlight, desc = "Highlight Surrounding" },
					{ opts.mappings.replace, desc = "Replace Surrounding" },
					{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
				}
				mappings = vim.tbl_filter(function(m)
					return m[1] and #m[1] > 0
				end, mappings)
				return vim.list_extend(mappings, keys)
			end
		end,
	},

	{
		"gerazov/toggle-bool.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>tb",
				function()
					require("toggle-bool").toggle_bool()
				end,
				desc = "Toggle Bool",
			},
		},
		opts = {
			additional_toggles = {
				Yes = "No",
				On = "Off",
				["0"] = "1",
				Enable = "Disable",
				Enabled = "Disabled",
				First = "Last",
				Before = "After",
				Persistent = "Ephemeral",
				Internal = "External",
				Start = "Stop",
				In = "Out",
				Open = "Close",
				Enter = "Exit",
				Lock = "Unlock",
				Connect = "Disconnect",
				Mount = "Dismount",
				Import = "Export",
				Ingress = "Egress",
				Allow = "Deny",
				All = "None",
			},
		},
	},

	{
		"uga-rosa/ccc.nvim",
		event = "LazyFile",
		keys = {
			{ "<leader>uH", "<Cmd>CccHighlighterToggle<CR>", desc = "CccHighlighter Toggle" },
			{ "<leader>th", "<Cmd>CccConvert<CR>", desc = "CccHighlighter Convert" },
			{ "<leader>Hp", "<Cmd>CccPick<CR>", desc = "CccHighlighter Pick" },
		},
		opts = {
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		},
	},
}
