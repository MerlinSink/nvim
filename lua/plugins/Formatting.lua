return {
	"stevearc/conform.nvim",
  lazy = true,
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format()
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			fish = { "fish_indent" },
			c = { "clang-format" },
			cpp = { "clang-format" },
      json = { "prettier" },
		},
		-- Set default options
		default_format_opts = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = "fallback",
		},
		-- Customize formatters
		formatters = {
			-- shfmt = {
			-- 	prepend_args = { "-i", "2" },
			-- },
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
