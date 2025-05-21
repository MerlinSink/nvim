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

		vim.o.laststatus = vim.g.lualine_laststatus

		local opts = {
			options = {
				theme = "auto",
				globalstatus = vim.o.laststatus == 3,
				component_separators = {},
				section_separators = {},
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
					winbar = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},

				lualine_x = {
					-- {
					--   function() return require("noice").api.status.command.get() end,
					--   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
					--   color = function() return { fg = Snacks.util.color("Statement") } end,
					-- },
				},
				lualine_y = {},
				lualine_z = {},
			},

			winbar = {
				lualine_c = {},
				lualine_x = {},
			},
			extensions = { "neo-tree", "lazy", "fzf" },
		}

		-- Inserts a component in lualine_.. at left section
		local function ins_left(area, section, component)
			table.insert(opts[area]["lualine_" .. section], component)
		end

		-- Inserts a component in lualine_.. at right section
		local function ins_right(area, section, component)
			table.insert(opts[area]["lualine_" .. section], component)
		end

		local function Scrollbar()
			local chars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
			-- local chars = { "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " }
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local index = math.floor((current_line / total_lines) * #chars)
			if index < 1 then
				index = 1
			end
			return chars[index]
		end

		-- Sections
		ins_left("sections", "a", {
			function()
				return " "
			end,
			padding = { left = 0, right = 0 },
		})

		ins_left("sections", "b", {
			"branch",
			icon = "",
			color = {
				bg = "NONE",
			},
		})

		ins_left("sections", "c", {
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
		})

		ins_left("sections", "c", {
			"diagnostics",
			symbols = {
				error = icons.diagnostics.Error,
				warn = icons.diagnostics.Warn,
				info = icons.diagnostics.Info,
				hint = icons.diagnostics.Hint,
			},
			padding = { left = 0, right = 0 },
		})

		ins_right("sections", "x", {
			"filetype",
			icon_only = true,
			separator = "",
			padding = { left = 0, right = 0 },
		})

		ins_right("sections", "x", {
			"filename",
			symbols = {
				modified = "",
				readonly = "",
				unnamed = "",
				newfile = "",
			},
			padding = { left = 0, right = 1 },
		})

    -- stylua: ignore
		ins_right("sections", "x", {
			function() return Snacks.profiler.status() end,
			cond = function() return Snacks and Snacks.profiler and Snacks.profiler.status end,
		})

    -- stylua: ignore
    ins_right("sections", "x", {
      function() return require("noice").api.status.mode.get() end,
      cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
      color = function() return { fg = Snacks.util.color("Constant") } end,
    })

    -- stylua: ignore
    ins_right("sections", "x", {
      function() return "  " .. require("dap").status() end,
      cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
      color = function() return { fg = Snacks.util.color("Debug") } end,
    })

		ins_right("sections", "z", {
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

		-- Winbar
		ins_left("winbar", "c", {
			function()
				return require("nvim-navic").get_location()
			end,
			cond = function()
				return require("nvim-navic").is_available()
			end,
		})

		ins_right("winbar", "x", {
			require("lazy.status").updates,
			cond = require("lazy.status").has_updates,
			color = function()
				return { fg = Snacks.util.color("Special") }
			end,
		})

		return opts
	end,
}
