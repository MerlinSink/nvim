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

-- Snacks_keymaps
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup("Snacks_toggle_set"),
	callback = function()
		-- Setup some globals for debugging (lazy-loaded)
		_G.dd = function(...)
			Snacks.debug.inspect(...)
		end
		_G.bt = function()
			Snacks.debug.backtrace()
		end
		vim.print = _G.dd -- Override print to use snacks for `:=` command

		-- Create some toggle mappings
        -- stylua: ignore start
		Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		Snacks.toggle.diagnostics():map("<leader>ud")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
		Snacks.toggle.treesitter():map("<leader>uT")
		Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.indent():map("<leader>ug")
		Snacks.toggle.dim():map("<leader>uD")
		-- stylua: ignore end
	end,
})
