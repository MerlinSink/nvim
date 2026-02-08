local opts = {
	default_file_explorer = false,
	columns = {
		"icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	delete_to_trash = false,
	skip_confirm_for_simple_edits = false,
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = false,
	},
	constrain_cursor = "editable",
	watch_for_changes = false,
	keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
		["<leader>v"] = { "actions.select", opts = { vertical = true } },
		["<leader>h"] = { "actions.select", opts = { horizontal = true } },
		["<leader>t"] = { "actions.select", opts = { tab = true } },
		["<leader>p"] = "actions.preview",
		["q"] = { "actions.close", mode = "n" },
		["<leader>r"] = "actions.refresh",
		["["] = { "actions.parent", mode = "n" },
		["<leader>o;"] = { "actions.open_cwd", mode = "n" },
		["`"] = { "actions.cd", mode = "n" },
		["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
		["gx"] = "actions.open_external",
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["gt"] = { "actions.toggle_trash", mode = "n" },
	},
	use_default_keymaps = false,
	view_options = {
		show_hidden = false,
		is_hidden_file = function(name, bufnr)
			local m = name:match("^%.")
			return m ~= nil
		end,
		is_always_hidden = function(name, bufnr)
			return false
		end,
		natural_order = "fast",
		case_insensitive = false,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
		highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
			return nil
		end,
	},
	extra_scp_args = {},
	git = {
		-- Return true to automatically git add/mv/rm files
		add = function(path)
			return false
		end,
		mv = function(src_path, dest_path)
			return false
		end,
		rm = function(path)
			return false
		end,
	},
	float = {
		padding = 2,
		max_width = 0.8, -- between 0 and 1
		max_height = 0.8,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		get_win_title = nil,
		preview_split = "auto",
		override = function(conf)
			return conf
		end,
	},
	preview_win = {
		update_on_cursor_moved = true,
		preview_method = "fast_scratch", -- "load"|"scratch"|"fast_scratch"
		disable_preview = function(filename)
			return false
		end,
		win_options = {},
	},
	confirmation = {
		-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		-- min_width and max_width can be a single value or a list of mixed integer/float types.
		-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
		max_width = 0.9,
		-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
		min_width = { 40, 0.4 },
		-- optionally define an integer/float for the exact width of the preview window
		width = nil,
		-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		-- min_height and max_height can be a single value or a list of mixed integer/float types.
		-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
		max_height = 0.9,
		-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
		min_height = { 5, 0.1 },
		-- optionally define an integer/float for the exact height of the preview window
		height = nil,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
	},
	-- Configuration for the floating progress window
	progress = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		width = nil,
		max_height = { 10, 0.9 },
		min_height = { 5, 0.1 },
		height = nil,
		border = "rounded",
		minimized_border = "none",
		win_options = {
			winblend = 0,
		},
	},
	ssh = {
		border = "rounded",
	},
	keymaps_help = {
		border = "rounded",
	},
}

SinkVim.keymap("n", "<leader>O", "<Cmd>Oil<CR>", "Oil")
SinkVim.keymap("n", "<leader>o", "<Cmd>Oil --float<CR>", "Oil Float")

require("oil").setup(opts)
