-- mini.ai
local opts_ai = {
	custom_textobjects = nil,

	mappings = {
		-- Main textobject prefixes
		around = "a",
		inside = "i",

		around_next = "an",
		inside_next = "in",
		around_last = "al",
		inside_last = "il",

		goto_left = "g[",
		goto_right = "g]",
	},

	n_lines = 50,
	search_method = "cover_or_next",
	silent = false,
}

-- mini.pairs
local opts_pairs = {
	-- In which modes mappings from this `config` should be created
	modes = { insert = true, command = false, terminal = false },

	mappings = {
		["("] = { action = "open", pair = "()", neigh_pattern = "^[^\\]" },
		["["] = { action = "open", pair = "[]", neigh_pattern = "^[^\\]" },
		["{"] = { action = "open", pair = "{}", neigh_pattern = "^[^\\]" },

		[")"] = { action = "close", pair = "()", neigh_pattern = "^[^\\]" },
		["]"] = { action = "close", pair = "[]", neigh_pattern = "^[^\\]" },
		["}"] = { action = "close", pair = "{}", neigh_pattern = "^[^\\]" },

		['"'] = { action = "closeopen", pair = '""', neigh_pattern = "^[^\\]", register = { cr = false } },
		["'"] = { action = "closeopen", pair = "''", neigh_pattern = "^[^%a\\]", register = { cr = false } },
		["`"] = { action = "closeopen", pair = "``", neigh_pattern = "^[^\\]", register = { cr = false } },
	},
}

-- mini.surround
local opts_surround = {
	custom_surroundings = nil,
	highlight_duration = 500,

	mappings = {
		add = "gsa", -- Add surrounding in Normal and Visual modes
		delete = "gsd", -- Delete surrounding
		find = "gsf", -- Find surrounding (to the right)
		find_left = "gsF", -- Find surrounding (to the left)
		highlight = "gsh", -- Highlight surrounding
		replace = "gsr", -- Replace surrounding

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},

	n_lines = 20,
	respect_selection_type = false,
	search_method = "cover",
	silent = false,
}

SinkVim.lazyload.ReadPreLoad(function ()
  require("mini.ai").setup(opts_ai)
  require("mini.pairs").setup(opts_pairs)
  require("mini.surround").setup(opts_surround)
end)
