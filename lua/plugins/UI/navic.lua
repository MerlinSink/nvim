return {
	"SmiteshP/nvim-navic",
  event = "VeryLazy",
	init = function()
		vim.g.navic_silence = true
		SinkVim.lsp.on_attach(function(client, buffer)
			if client.supports_method("textDocument/documentSymbol") then
				require("nvim-navic").attach(client, buffer)
			end
		end)
	end,
	opts = function()
		return {
			icons = SinkVim.icons.kinds,
			lsp = {
				auto_attach = false,
				preference = nil,
			},
			highlight = true,
			separator = " ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
			lazy_update_context = true,
			click = false,
			format_text = function(text)
				return text
			end,
		}
	end,
}
