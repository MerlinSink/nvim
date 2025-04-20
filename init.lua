local function load(name)
	local ok, err = pcall(require, name)
	if not ok then
		vim.notify("Failed to load module: " .. name .. "\n" .. err, vim.log.levels.WARN)
	end
end

local modules = {
	"config.options",
	"config.lazy",
	"config.keymaps",
	"config.highlights",
}

for _, module in ipairs(modules) do
	load(module)
end

vim.cmd([[colorscheme tokyonight]])
