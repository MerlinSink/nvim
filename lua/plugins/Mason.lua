return {
	"mason-org/mason.nvim",
	cmd = "Mason",
	dependencies = {
		{ "mason-org/mason-lspconfig.nvim", config = function() end },
		{
			"neovim/nvim-lspconfig",
			event = "LazyFile",
		},
	},
	opts = {
		ui = {
			border = "double",
			width = 0.7,
			height = 0.7,
		},
	},
	config = function(_, opts)
		-- get all the servers that are available through mason-lspconfig
		require("mason").setup()
		local registry = require("mason-registry")
		local pkgmap = require("mason-lspconfig.mappings").get_all().lspconfig_to_package
		local formatters = require("lazy.core.config").plugins["conform.nvim"].opts.formatters_by_ft

		local ensure_installed = {} ---@type string[]

		-- LSP Servers
		local lsp = SinkVim.lsp.get_lsp()
		for _, server in ipairs(lsp) do
			local pkg = pkgmap[server]
			if registry.has_package(pkg) then
				table.insert(ensure_installed, pkg)
			end
		end

		-- Formatters
		local temp = {}
		for _, fmt in pairs(formatters) do
			for _, tool in ipairs(fmt) do
				if not temp[tool] and registry.has_package(tool) then
					table.insert(ensure_installed, tool)
					temp[tool] = true
				end
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
	end,
}
