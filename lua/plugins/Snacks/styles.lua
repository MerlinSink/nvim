return {
	---@class snacks.styles.Config
	styles = {
		blame_line = {
			width = 0.6,
			height = 0.6,
			border = "rounded",
			title = " Git Blame ",
			title_pos = "center",
			ft = "git",
		},
		dashboard = {
			zindex = 10,
			height = 0,
			width = 0,
			bo = {
				bufhidden = "wipe",
				buftype = "nofile",
				buflisted = false,
				filetype = "snacks_dashboard",
				swapfile = false,
				undofile = false,
			},
			wo = {
				colorcolumn = "",
				cursorcolumn = false,
				cursorline = false,
				foldmethod = "manual",
				list = false,
				number = false,
				relativenumber = false,
				sidescrolloff = 0,
				signcolumn = "no",
				spell = false,
				statuscolumn = "",
				statusline = "",
				winbar = "",
				winhighlight = "Normal:SnacksDashboardNormal,NormalFloat:SnacksDashboardNormal",
				wrap = false,
			},
		},
		float = {
			position = "float",
			backdrop = 60,
			height = 0.9,
			width = 0.9,
			zindex = 50,
		},
		help = {
			position = "float",
			backdrop = false,
			border = "top",
			row = -1,
			width = 0,
			height = 0.3,
		},
		input = {
			backdrop = false,
			position = "float",
			border = "rounded",
			title_pos = "center",
			height = 1,
			width = 60,
			relative = "editor",
			noautocmd = true,
			row = 2,
			-- relative = "cursor",
			-- row = -3,
			-- col = 0,
			wo = {
				winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
				cursorline = false,
			},
			bo = {
				filetype = "snacks_input",
				buftype = "prompt",
			},
			--- buffer local variables
			b = {
				completion = false, -- disable blink completions in input
			},
			keys = {
				n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
				i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
				i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
				i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
				i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
				i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
				i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
				q = "cancel",
			},
		},
		minimal = {
			wo = {
				cursorcolumn = false,
				cursorline = false,
				cursorlineopt = "both",
				colorcolumn = "",
				fillchars = "eob: ,lastline:…",
				list = false,
				listchars = "extends:…,tab:  ",
				number = false,
				relativenumber = false,
				signcolumn = "no",
				spell = false,
				winbar = "",
				statuscolumn = "",
				wrap = false,
				sidescrolloff = 0,
			},
		},
		notification = {
			border = "rounded",
			zindex = 100,
			ft = "markdown",
			wo = {
				winblend = 5,
				wrap = false,
				conceallevel = 2,
				colorcolumn = "",
			},
			bo = { filetype = "snacks_notif" },
		},
		notification_history = {
			border = "rounded",
			zindex = 100,
			width = 0.6,
			height = 0.6,
			minimal = false,
			title = " Notification History ",
			title_pos = "center",
			ft = "markdown",
			bo = { filetype = "snacks_notif_history", modifiable = false },
			wo = { winhighlight = "Normal:SnacksNotifierHistory" },
			keys = { q = "close" },
		},
		terminal = {
			bo = {
				filetype = "snacks_terminal",
			},
			wo = {},
			keys = {
				q = "hide",
				gf = function(self)
					local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
					if f == "" then
						Snacks.notify.warn("No file under cursor")
					else
						self:hide()
						vim.schedule(function()
							vim.cmd("e " .. f)
						end)
					end
				end,
				term_normal = {
					"<esc>",
					function(self)
						self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
						if self.esc_timer:is_active() then
							self.esc_timer:stop()
							vim.cmd("stopinsert")
						else
							self.esc_timer:start(200, 0, function() end)
							return "<esc>"
						end
					end,
					mode = "t",
					expr = true,
					desc = "Double escape to normal mode",
				},
			},
		},
	},
}
