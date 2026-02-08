local mason_opts = {
	ui = {
		border = "double",
		width = 0.7,
		height = 0.7,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

local mason_dap_opts = {
	automatic_installation = true,

	-- You can provide additional configuration to the handlers,
	-- see mason-nvim-dap README for more information
	handlers = {},

	-- You'll need to check that you have the required things installed
	-- online, please don't ask me how to install them :)
	ensure_installed = {
		-- Update this to ensure that you have the debuggers for the langs you want
		"codelldb",
	},
}

require("mason").setup(mason_opts)
require("mason-nvim-dap").setup(mason_dap_opts)
local pkgmap = require("mason-lspconfig.mappings").get_all().lspconfig_to_package

local registry = require("mason-registry")
local servers = {
	-- LSP Servers
	"lua_ls",
	"clangd",
	"pyright",
	"basedpyright",

	-- Formatters
	"stylua",
	"shfmt",
	"clang-format",
	"ruff",
}
local ensure_installed = {} ---@type string[]

for _, server in ipairs(servers) do
	local pkg = pkgmap[server]
	if registry.has_package(pkg) then
		table.insert(ensure_installed, pkg)
	end
end

registry.refresh(function()
	for _, tool in ipairs(ensure_installed) do
		local p = registry.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end)
