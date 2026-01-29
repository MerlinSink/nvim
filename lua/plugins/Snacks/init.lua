local opts = {
	explorer = { enabled = false },
	dashboard = { enabled = false },
}

local modules = {
	"indent",
	"scroll",
	"picker",
	"notifier",
}

opts = SinkVim.load("plugins.Snacks.", modules, opts)

require("snacks").setup(opts)
