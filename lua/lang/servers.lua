local M = {}

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/lang", [[v:val =~ '\.lua$']])) do
	if file ~= "servers.lua" and file ~= "util.lua" then
		local lsp = require("lang." .. file:gsub("%.lua$", ""))
		M = vim.tbl_deep_extend("force", M, lsp)
	end
end

return M
