local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- Smart colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
	group = augroup("smart_colorscheme"),
	callback = function()
		local path = vim.fn.stdpath("config") .. "/lua/config/setting.json"
		local color = vim.g.colors_name or "none"
		local current = SinkVim.json.read(path)
		local pre = current and current.colorscheme or nil
		if pre ~= color then
			SinkVim.json.write({ colorscheme = color }, path)
		end
	end,
})
