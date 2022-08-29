require("basic")

require("keybindings")

require("plugins")

-- === Theme ===
require("colorscheme")

-- === Plingin ===
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
require("plugin-config.surround")

-- === LSP ===
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
-- require("lsp.null-ls")
require("lsp.lspsaga")

-- === UI ===
require("plugin-config.indent-blankline")
