local opts = {
	heading = {
		enabled = true,
		render_modes = false,
		atx = true,
		setext = true,
		sign = true,
		icons = { "󰼏 ", "󰎨 ", "󰼑 ", "󰎲 ", "󰼓 ", "󰎴 " },
	},
	code = {
		sign = false,
		style = "full",
		width = "block",
		left_pad = 2,
		right_pad = 4,
	},
	checkbox = {
		enabled = true,
		custom = {
			important = {
				raw = "[~]",
				rendered = "󰓎 ",
				highlight = "DiagnosticWarn",
			},
		},
	},
}

require("render-markdown").setup(opts)

if Snacks then
	Snacks.toggle({
		name = "Render Markdown",
		get = function()
			return require("render-markdown.state").enabled
		end,
		set = function(enabled)
			local m = require("render-markdown")
			if enabled then
				m.enable()
			else
				m.disable()
			end
		end,
	}):map("<leader>um")
end
