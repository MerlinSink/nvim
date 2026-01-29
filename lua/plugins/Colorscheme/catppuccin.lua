local opts = {
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	float = {
		transparent = true, -- enable transparent floating windows
		solid = false, -- use solid styling for floating windows, see |winborder|
	},
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)

	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},

	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
	lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
		virtual_text = {
			errors = { "italic" },
			hints = { "italic" },
			warnings = { "italic" },
			information = { "italic" },
			ok = { "italic" },
		},
		underlines = {
			errors = { "underline" },
			hints = { "underline" },
			warnings = { "underline" },
			information = { "underline" },
			ok = { "underline" },
		},
		inlay_hints = {
			background = true,
		},
	},
	color_overrides = {},
	custom_highlights = {},
	default_integrations = true,
	auto_integrations = false,

	integrations = {
		aerial = true,
		alpha = true,
		cmp = true,
		dashboard = true,
		flash = false,
		fzf = true,
		grug_far = true,
		gitsigns = true,
		headlines = true,
		illuminate = true,
		indent_blankline = { enabled = true },
		leap = true,
		lsp_trouble = true,
		mason = true,
		markdown = true,
		mini = true,
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
		navic = { enabled = true, custom_bg = "lualine" },
		neotest = true,
		neotree = true,
		noice = true,
		notify = true,
		semantic_tokens = true,
		snacks = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		which_key = true,
	},
}

if (vim.g.colors_name or ""):find("catppuccin") then
  opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
end

require("catppuccin").setup(opts)
