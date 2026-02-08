vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

local opts = {
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		fish = { "fish_indent" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		py = { "ruff_organize_imports", "ruff_format" },
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

SinkVim.keymap("n", "<leader>ci", "<cmd>ConformInfo<CR>", "Conform Info")
-- stylua: ignore
SinkVim.keymap({ "n", "v" }, "<leader>cf", function() require("conform").format() end, "Format buffer")

require("conform").setup(opts)
