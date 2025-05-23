return {
	"keaising/im-select.nvim",
  ft = "markdown",
	config = function()
		require("im_select").setup({
			default_im_select = "1033",
			default_command = "im-select.exe",
			disable_auto_restore = 0,
			set_default_events = { "InsertLeave", "CmdlineLeave" },
			async_switch_im = true,
		})
	end,
}
