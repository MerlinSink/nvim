return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		-- PERF: we don't need this lualine require madness 🤷
		local lualine_require = require("lualine_require")
		lualine_require.require = require
		local icons = SinkVim.icons

		vim.o.laststatus = vim.g.lualine_laststatus

		local opts = {
			options = {
				theme = "auto",
				globalstatus = vim.o.laststatus == 3,
				component_separators = {},
				section_separators = {},
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
					-- winbar = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},

				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},

			extensions = { "neo-tree", "lazy", "fzf" },
		}

		-- Inserts a component in lualine_.. or winbar/tapline at any section
		local function ins(area, section, component)
			table.insert(opts[area]["lualine_" .. section], component)
		end

		local function Scrollbar()
			local chars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local index = math.floor((current_line / total_lines) * #chars)
			if index < 1 then
				index = 1
			end
			return chars[index]
		end

		-- Sections
		ins("sections", "a", {
			function()
				return " "
			end,
			padding = { left = 0, right = 0 },
		})

		ins("sections", "b", {
			"branch",
			icon = "",
			color = {
				bg = "NONE",
			},
			padding = { left = 1, right = 0 },
		})

		ins("sections", "c", {
			"diff",
			symbols = {
				added = icons.git.added,
				modified = icons.git.modified,
				removed = icons.git.removed,
			},
			source = function()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end,
			padding = { left = 1, right = 1 },
		})

		ins("sections", "c", {
			"diagnostics",
			symbols = {
				error = icons.diagnostics.Error,
				warn = icons.diagnostics.Warn,
				info = icons.diagnostics.Info,
				hint = icons.diagnostics.Hint,
			},
			padding = { left = 1, right = 0 },
		})

		ins("sections", "x", {
			require("lazy.status").updates,
			cond = require("lazy.status").has_updates,
			color = function()
				return { fg = Snacks.util.color("Special") }
			end,
		})

    -- stylua: ignore
		ins("sections", "x", {
			function() return require("noice").api.status.lsp_progress.get() end,
			cond = function() return package.loaded["noice"] and require("noice").api.status.lsp_progress.has() end,
			color = { fg = "#fab387" },
		})

	   -- stylua: ignore
		ins("sections", "x", {
			function() return Snacks.profiler.status() end,
			cond = function() return Snacks and Snacks.profiler and Snacks.profiler.status end,
		})

	   -- stylua: ignore
	   ins("sections", "x", {
	     function() return require("noice").api.status.mode.get() end,
	     cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
	     color = function() return { fg = Snacks.util.color("Constant") } end,
	   })

	   -- stylua: ignore
	   ins("sections", "x", {
	     function() return "  " .. require("dap").status() end,
	     cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
	     color = function() return { fg = Snacks.util.color("Debug") } end,
	   })

		ins("sections", "x", {
			"lsp_status",
			icon = "", -- f013
			symbols = {
				-- Standard unicode symbols to cycle through for LSP progress:
				spinner = "" ,
				-- spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
				-- Standard unicode symbol for when LSP is done:
				done = "",
				-- done = "✓",
				-- Delimiter inserted between LSP names:
				separator = " ",
			},
			-- List of LSP names to ignore (e.g., `null-ls`):
			ignore_lsp = {},
			padding = { left = 0, right = 1 },
		})

		ins("sections", "x", {
			"filetype",
			icon_only = true,
			separator = "",
			padding = { left = 1, right = 0 },
		})

		ins("sections", "x", {
			"filename",
			symbols = {
				modified = "",
				readonly = "",
				unnamed = "",
				newfile = "",
			},
			padding = { left = 0, right = 1 },
		})

		ins("sections", "z", {
			Scrollbar,
			color = function()
				local mode = vim.fn.mode()
				local mode_color = {
					n = "lualine_a_normal",
					i = "lualine_a_insert",
					v = "lualine_a_visual",
					V = "lualine_a_visual",
					[""] = "lualine_a_visual",
					c = "lualine_a_command",
					R = "lualine_a_replace",
					t = "lualine_a_terminal",
				}
				local hl_group = mode_color[mode] or "lualine_a_normal"
				local fg = require("lualine.utils.utils").extract_highlight_colors(hl_group, "bg")
				return { fg = fg, gui = "bold", bg = "NONE" }
			end,
			padding = { left = 0, right = 0 },
		})


		return opts
	end,
}
