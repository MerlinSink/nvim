SinkVim.keymap("n", "<leader>ci", "<cmd>ConformInfo<CR>", "Conform Info")
SinkVim.keymap({ "n", "v" }, "<leader>cf", function() require("conform").format() end, "Format buffer")
