return {
	---@class snacks.win.Config: vim.api.keyset.win_config
	win = {
		show = true,
		fixbuf = true,
		relative = "editor",
		position = "float",
		minimal = true,
		wo = {
			winhighlight = "Normal:SnacksNormal,NormalNC:SnacksNormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC",
		},
		bo = {},
		keys = {
			q = "close",
		},
	},
}
