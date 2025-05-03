local M = {}

-- define events
local lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }

---@param list table<string>
---@return table<string>
function M.dedup(list)
	local seen = {}
	local result = {}
	for _, i in ipairs(list) do
		if not seen[i] then
			table.insert(result, i)
			seen[i] = true
		end
	end
	return result
end

-- Add LazyFile event
function M.lazy_file()
	local Event = require("lazy.core.handler.event")
	Event.mappings.LazyFile = { id = "LazyFile", event = lazy_file_events }
	Event.mappings["User LazyFile"] = Event.mappings.LazyFile
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
