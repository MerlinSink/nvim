vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

local opts = {
-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			c = { "clang-format" },
			cpp = { "clang-format" },
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
}

require("conform").setup(opts)
