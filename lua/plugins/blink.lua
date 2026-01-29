local opts = {
	snippets = {
		preset = "luasnip",
	},
	appearance = {
		-- sets the fallback highlight groups to nvim-cmp's highlight groups
		-- useful for when your theme doesn't support blink.cmp
		-- will be removed in a future release, assuming themes add support
		use_nvim_cmp_as_default = false,
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},
	completion = {
		keyword = {
			range = "full",
		},
		accept = {
			-- experimental auto-brackets support
			auto_brackets = {
				enabled = true,
			},
		},
		menu = {
			draw = {
				treesitter = { "lsp" },
			},
			border = "rounded",
			scrollbar = true,
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
		ghost_text = {
			enabled = vim.g.ai_cmp,
		},
	},

	-- experimental signature help support
	-- signature = { enabled = true },
	--
	cmdline = {
		enabled = true,
		keymap = {
			preset = "none",
			["<CR>"] = { "accept_and_enter", "fallback" },

			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
		},
		completion = { menu = { auto_show = true } },
	},

	sources = {
		-- adding any nvim-cmp sources here will enable them
		-- with blink.compat
		-- compat = {},
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
			cmdline = {
				min_keyword_length = function(ctx)
					-- when typing a command, only show when the keyword is 3 characters or longer
					if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
						return 3
					end
					return 0
				end,
			},
		},
	},

	keymap = {
		preset = "none",
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide" },
		["<CR>"] = { "accept", "fallback" },

		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		-- ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
		-- ["<C-n>"] = { "select_next", "fallback_to_mappings" },

		["<C-n>"] = { "scroll_documentation_up", "fallback" },
		["<C-p>"] = { "scroll_documentation_down", "fallback" },

		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },

		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
	},
}

require("blink.cmp").setup(opts)
