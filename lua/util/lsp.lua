local M = {}

function M.get_lsp()
	local lsp = {}
	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lsp", [[v:val =~ '\.lua$']])) do
		local name = file:match("^(.*)%.lua$")
		if name then
			table.insert(lsp, name)
		end
	end
	return lsp
end

---@param on_attach fun(client:vim.lsp.Client, buffer)
---@param name? string
function M.on_attach(on_attach, name)
	return vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf ---@type number
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and (not name or client.name == name) then
				return on_attach(client, buffer)
			end
		end,
	})
end

function M.on_supports_method(method, callback)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local buffer = args.buf
			if client and client.supports_method and client.supports_method(method) then
				callback(client, buffer)
			end
		end,
	})
end

return M
