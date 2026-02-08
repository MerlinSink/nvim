-- stylua: ignore start
-- Top Pickers & Explorer
SinkVim.keymap("n", "<leader><CR>", function() Snacks.picker.smart({ layout = "telescope" }) end, "Smart Find Files")
SinkVim.keymap("n", "<leader>/", function() Snacks.picker.grep() end, "Grep")
SinkVim.keymap("n", "<leader>:", function() Snacks.picker.command_history() end, "Command History")
-- SinkVim.keymap("n", "<leader>e", function() Snacks.explorer() end, "File Explorer")

-- find
SinkVim.keymap("n", "<leader>fb", function() Snacks.picker.buffers({ layout = "select" }) end, "Buffers")
SinkVim.keymap("n", "<leader>fc", function() Snacks.picker.files({ layout = "select", cwd = vim.fn.stdpath("config") }) end, "Find Config File")
SinkVim.keymap("n", "<leader>ff", function() Snacks.picker.files() end, "Find Files")
SinkVim.keymap("n", "<leader>fg", function() Snacks.picker.git_files() end, "Find Git Files")
SinkVim.keymap("n", "<leader>fp", function() Snacks.picker.projects({ layout = "select" }) end, "Projects")
SinkVim.keymap("n", "<leader>fr", function() Snacks.picker.recent() end, "Recent")

-- git
SinkVim.keymap("n", "<leader>gb", function() Snacks.picker.git_branches() end, "Git Branches")
SinkVim.keymap("n", "<leader>gl", function() Snacks.picker.git_log() end, "Git Log")
SinkVim.keymap("n", "<leader>gL", function() Snacks.picker.git_log_line() end, "Git Log Line")
SinkVim.keymap("n", "<leader>gs", function() Snacks.picker.git_status() end, "Git Status")
SinkVim.keymap("n", "<leader>gS", function() Snacks.picker.git_stash() end, "Git Stash")
SinkVim.keymap("n", "<leader>gd", function() Snacks.picker.git_diff() end, "Git Diff (Hunks)")
SinkVim.keymap("n", "<leader>gf", function() Snacks.picker.git_log_file() end, "Git Log File")
SinkVim.keymap("n", "<leader>lg", function() Snacks.lazygit() end, "Lazygit")

-- Grep
SinkVim.keymap("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, "Grep Open Buffers")
SinkVim.keymap("n", "<leader>sg", function() Snacks.picker.grep() end, "Grep")
SinkVim.keymap("n", "<leader>sw", function() Snacks.picker.grep_word() end, "Visual selection or word")

-- search
SinkVim.keymap("n", '<leader>s"', function() Snacks.picker.registers() end, "Registers")
SinkVim.keymap("n", "<leader>s/", function() Snacks.picker.search_history() end, "Search History")
SinkVim.keymap("n", "<leader>sa", function() Snacks.picker.autocmds() end, "Autocmds")
SinkVim.keymap("n", "<leader>sb", function() Snacks.picker.lines() end, "Buffer Lines")
SinkVim.keymap("n", "<leader>sC", function() Snacks.picker.commands({ layout = "vscode" }) end, "Commands")
SinkVim.keymap("n", "<leader>sd", function() Snacks.picker.diagnostics() end, "Diagnostics")
SinkVim.keymap("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, "Buffer Diagnostics")
SinkVim.keymap("n", "<leader>sh", function() Snacks.picker.help({ layout = "dropdown" }) end, "Help Pages")
SinkVim.keymap("n", "<leader>sH", function() Snacks.picker.highlights() end, "Highlights")
SinkVim.keymap("n", "<leader>si", function() Snacks.picker.icons() end, "Icons")
SinkVim.keymap("n", "<leader>sj", function() Snacks.picker.jumps() end, "Jumps")
SinkVim.keymap("n", "<leader>sk", function() Snacks.picker.keymaps() end, "Keymaps")
SinkVim.keymap("n", "<leader>sl", function() Snacks.picker.loclist() end, "Location List")
SinkVim.keymap("n", "<leader>sm", function() Snacks.picker.marks() end, "Marks")
SinkVim.keymap("n", "<leader>sM", function() Snacks.picker.man() end, "Man Pages")
SinkVim.keymap("n", "<leader>sp", function() Snacks.picker.lazy({ layout = "vertical" }) end, "Search for Plugin Spec")
SinkVim.keymap("n", "<leader>sq", function() Snacks.picker.qflist() end, "Quickfix List")
SinkVim.keymap("n", "<leader>sR", function() Snacks.picker.resume() end, "Resume")
SinkVim.keymap("n", "<leader>su", function() Snacks.picker.undo({ layout = "vertical" }) end, "Undo History")
SinkVim.keymap("n", "<leader>uC", function() Snacks.picker.colorschemes({ layout = "select" }) end, "Colorschemes")

-- Other
SinkVim.keymap("n", "<leader>Z", function() Snacks.zen.zoom() end, "Toggle Zoom")
SinkVim.keymap("n", "<leader>.", function() Snacks.scratch() end, "Toggle Scratch Buffer")
SinkVim.keymap("n", "<leader>S", function() Snacks.scratch.select() end, "Select Scratch Buffer")
SinkVim.keymap("n", "<leader>n", function() Snacks.notifier.show_history() end, "Notification History")
SinkVim.keymap("n", "<leader>bd", function() Snacks.bufdelete() end, "Delete Buffer")
SinkVim.keymap("n", "<leader>cR", function() Snacks.rename.rename_file() end, "Rename File")
SinkVim.keymap("n", "<leader>un", function() Snacks.notifier.hide() end, "Dismiss All Notifications")
SinkVim.keymap("n", "<C-/>", function() Snacks.terminal() end, "Toggle Terminal")
-- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
-- {
--   "<leader>N",
--   desc = "Neovim News",
--   function()
--     Snacks.win({
--       file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
--       width = 0.6,
--       height = 0.6,
--       wo = {
--         spell = false,
--         wrap = false,
--         signcolumn = "yes",
--         statuscolumn = " ",
--         conceallevel = 3,
--       },
--     })
--   end,
-- }
-- stylua: ignore end
