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

function M.load(prefix, modules, opts)
	local config = opts or {}
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

function M.check_nixos()
	if not M.check_sys("Linux") then
		return false
	end

	local ok, lines = pcall(vim.fn.readfile, "/etc/os-release")
	if ok then
		for _, line in ipairs(lines) do
			if line:match("^ID=nixos") then
				return true
			end
		end
	end

	return vim.uv.fs_stat("/run/current-system/nixos-version") ~= nil
end

function M.keymap(mode, keys, func, desc)
	vim.keymap.set(mode, keys, func, { desc = desc })
end

return M
