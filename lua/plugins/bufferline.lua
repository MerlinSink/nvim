local opts = {
	options = {
		separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { "any", "any" },
        -- stylua: ignore start
        close_command = function(n) Snacks.bufdelete(n) end,
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
		-- stylua: ignore end
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon", -- "icon" | "underline" | "none",
		},
		diagnostics = "nvim_lsp",
		always_show_bufferline = true,
		diagnostics_indicator = function(_, _, diag)
			local icons = SinkVim.icons.diagnostics
			local ret = (diag.error and icons.Error .. diag.error .. " " or "")
				.. (diag.warning and icons.Warn .. diag.warning or "")
			return vim.trim(ret)
		end,
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neo-tree",
				highlight = "Directory",
				text_align = "left",
			},
			{
				filetype = "snacks_layout_box",
			},
		},
	},
}

require("bufferline").setup(opts)
