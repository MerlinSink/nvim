local M = {}
local group = vim.api.nvim_create_augroup("Plugin_LazyLoad", { clear = true })

function M.UIEnterLoad(callback)
	vim.api.nvim_create_autocmd("UIEnter", {
		group = group,
		once = true,
		callback = function()
			vim.schedule(function()
				callback()
			end)
		end,
	})
end

function M.InsertLoad(callback)
	vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
		group = group,
		once = true,
		callback = function()
			callback()
		end,
	})
end

function M.ReadPreLoad(callback)
	vim.api.nvim_create_autocmd({ "BufReadPre", "BufReadPost" }, {
		group = group,
		once = true,
		callback = function()
			callback()
		end,
	})
end

return M
