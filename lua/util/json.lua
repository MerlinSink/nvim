local M = {}

function M.read(path)
	local success, file = pcall(vim.fn.readfile, path)
	if not success then
		vim.notify("fail to read: " .. path, vim.log.levels.ERROR)
		return
	end
	local content = table.concat(file, "\n")
	return vim.json.decode(content)
end

function M.write(data, path)
	local existing = {}

	local ok, content = pcall(vim.fn.readfile, path)
	if ok then
		local text = table.concat(content, "\n")
		local success, decoded = pcall(vim.json.decode, text)
		if success and type(decoded) == "table" then
			existing = decoded
		end
	end

    local merged = vim.tbl_deep_extend("force", existing, data)

	local encoded = vim.json.encode(merged)
	local file = vim.split(encoded, "\n")
	local success = pcall(vim.fn.writefile, file, path)
	if not success then
		vim.notify("fail to write: " .. path, vim.log.levels.ERROR)
	end
end

return M
