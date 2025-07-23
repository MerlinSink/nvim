return {
	"gerazov/toggle-bool.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>cb",
			function()
				require("toggle-bool").toggle_bool()
			end,
			desc = "Toggle Bool",
		},
	},
	opts = {
		additional_toggles = {
			Yes = "No",
			On = "Off",
			["0"] = "1",
			Enable = "Disable",
			Enabled = "Disabled",
			First = "Last",
			Before = "After",
			Persistent = "Ephemeral",
			Internal = "External",
			Start = "Stop",
			In = "Out",
			Open = "Close",
			Enter = "Exit",
			Lock = "Unlock",
			Connect = "Disconnect",
			Mount = "Dismount",
			Import = "Export",
			Ingress = "Egress",
			Allow = "Deny",
			All = "None",
		},
	},
}
