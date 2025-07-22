local M = {}

setmetatable(M, {
	__index = function(t, k)
		local success, mod = pcall(require, "util." .. k)
		if success then
			t[k] = mod
			return mod
		else
			error(("Module util.%s not found: %s"):format(k, mod))
		end
	end,
})

-- define events
local lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }

-- Add LazyFile event
function M.lazy_file()
	local Event = require("lazy.core.handler.event")
	Event.mappings.LazyFile = { id = "LazyFile", event = lazy_file_events }
	Event.mappings["User LazyFile"] = Event.mappings.LazyFile
end

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

function M.load(prefix, modules)
	local config = {}
	for _, mod in ipairs(modules) do
		local ok, conf = pcall(require, prefix .. mod)
		if ok and type(conf) == "table" then
			config = vim.tbl_deep_extend("force", config, conf)
		else
			vim.notify("Failed to load module: " .. prefix .. mod, vim.log.levels.WARN)
		end
	end
	return config
end

-- systermCheck
function M.check_sys(sysname)
	return vim.uv.os_uname().sysname:find(sysname) ~= nil
end

function M.has(name)
	return require("lazy.core.config").spec.plugins[name] ~= nil
end

return M
