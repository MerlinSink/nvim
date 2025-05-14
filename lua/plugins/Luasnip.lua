return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	build = not require("config.util").is_win
			and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
		or nil,
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/Snippets" } })
			end,
		},
	},
	opts = {
		history = true,
		delete_check_events = "TextChanged",
		enable_autosnippets = true,
	},
	config = function(_, opts)
		require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/Snippets" } })

		local actions = require("config.util").actions
		actions.snippet_forward = function()
			if require("luasnip").jumpable(1) then
				vim.schedule(function()
					require("luasnip").jump(1)
				end)
				return true
			end
		end
		actions.snippet_stop = function()
			if require("luasnip").expand_or_jumpable() then -- or just jumpable(1) is fine?
				require("luasnip").unlink_current()
				return true
			end
		end

		local types = require("luasnip.util.types")
		require("luasnip").config.setup({
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "GruvboxOrange" } },
					},
				},
				[types.insertNode] = {
					active = {
						virt_text = { { "●", "GruvboxBlue" } },
					},
				},
			},
		})
		require("luasnip").setup(opts)
	end,
}
