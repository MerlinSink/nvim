-- stylua: ignore start
-- dap
SinkVim.keymap("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Breakpoint Condition")
SinkVim.keymap("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Breakpoint Condition")
SinkVim.keymap("n", "<leader>db", function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint")
SinkVim.keymap("n", "<leader>dc", function() require("dap").continue() end, "Run/Continue")
SinkVim.keymap("n", "<leader>da", function() require("dap").continue({ before = get_args }) end, "Run with Args")
SinkVim.keymap("n", "<leader>dC", function() require("dap").run_to_cursor() end, "Run to Cursor")
SinkVim.keymap("n", "<leader>dg", function() require("dap").goto_() end, "Go to Line (No Execute)")
SinkVim.keymap("n", "<leader>di", function() require("dap").step_into() end, "Step Into")
SinkVim.keymap("n", "<leader>dj", function() require("dap").down() end, "Down")
SinkVim.keymap("n", "<leader>dk", function() require("dap").up() end, "Up")
SinkVim.keymap("n", "<leader>dl", function() require("dap").run_last() end, "Run Last")
SinkVim.keymap("n", "<leader>do", function() require("dap").step_out() end, "Step Out")
SinkVim.keymap("n", "<leader>dO", function() require("dap").step_over() end, "Step Over")
SinkVim.keymap("n", "<leader>dP", function() require("dap").pause() end, "Pause")
SinkVim.keymap("n", "<leader>dr", function() require("dap").repl.toggle() end, "Toggle REPL")
SinkVim.keymap("n", "<leader>ds", function() require("dap").session() end, "Session")
SinkVim.keymap("n", "<leader>dt", function() require("dap").terminate() end, "Terminate")
SinkVim.keymap("n", "<leader>dw", function() require("dap.ui.widgets").hover() end, "Widgets")

-- dapui
SinkVim.keymap("n", "<leader>du", function() require("dapui").toggle({ }) end, "Dap UI")
SinkVim.keymap({ "n", "x" }, "<leader>de", function() require("dapui").eval() end, "Eval")

-- dappython
SinkVim.keymap("n","<leader>dPt", function() require('dap-python').test_method() end, "Debug Method")
SinkVim.keymap("n","<leader>dPc", function() require('dap-python').test_class() end, "Debug Class")
-- stylua: ignore end
