vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

local opts = {
	-- Define your formatters
	formatters_by_ft = {
		lua = { "stylua" },
		fish = { "fish_indent" },
		c = { "clang_format" },
		cpp = { "clang_format" },
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
		clang_format = {
			args = {
				-- "--style=file",
				-- "--style=Google", -- Google / LLVM / Mozilla / WebKit
                "--style={BasedOnStyle: Google, IndentWidth: 4, TabWidth: 4, ColumnLimit: 0}",
			},
		},
		-- shfmt = {
		-- 	prepend_args = { "-i", "2" },
		-- },
	},
}

SinkVim.keymap("n", "<leader>ci", "<cmd>ConformInfo<CR>", "Conform Info")
-- stylua: ignore
SinkVim.keymap({ "n", "v" }, "<leader>cf", function() require("conform").format() end, "Format buffer")

require("conform").setup(opts)
