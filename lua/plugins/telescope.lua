local actions = require("telescope.actions")
local function find_command()
	if 1 == vim.fn.executable("rg") then
		return { "rg", "--files", "--color", "never", "-g", "!.git" }
	elseif 1 == vim.fn.executable("fd") then
		return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
	elseif 1 == vim.fn.executable("fdfind") then
		return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
	elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
		return { "find", ".", "-type", "f" }
	elseif 1 == vim.fn.executable("where") then
		return { "where", "/r", ".", "*" }
	end
end

local opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		-- open files in the first window that is an actual file.
		-- use the current window if no other window is available.
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- ["<c-t>"] = open_with_trouble,
				-- ["<a-t>"] = open_with_trouble,
				-- ["<a-i>"] = find_files_no_ignore,
				-- ["<a-h>"] = find_files_with_hidden,
				["<C-Down>"] = actions.cycle_history_next,
				["<C-Up>"] = actions.cycle_history_prev,
				["<C-u>"] = actions.preview_scrolling_down,
				["<C-d>"] = actions.preview_scrolling_up,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = find_command,
			hidden = true,
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
}

require("telescope").setup(opts)
