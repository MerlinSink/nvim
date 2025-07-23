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
	local content = vim.json.encode(data)
	local file = vim.split(content, "\n")
	local success = pcall(vim.fn.writefile, file, path)
	if not success then
		vim.notify("fail to write: " .. path, vim.log.levels.ERROR)
	end
end

return M
