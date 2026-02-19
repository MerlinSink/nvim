local opts = {
	instructions_file = "avante.md",
	provider = "SiliconCloud",
	providers = {
		SiliconCloud = {
			__inherited_from = "openai",
			endpoint = "https://api.siliconflow.cn/v1",
			api_key_name = "SILICONCLOUD_API_KEY",
			model = "Pro/deepseek-ai/DeepSeek-V3.2",
		},
		openrouter = {
			use_ReAct_prompt = true,
			__inherited_from = "openai",
			endpoint = "https://openrouter.ai/api/v1",
			api_key_name = "OPENROUTER_API_KEY",
			model = "openai/gpt-oss-120b:free",
		},
	},
	behaviour = {
		auto_set_keymaps = false,
		auto_add_current_file = true,
	},
	mappings = {
		--- @class AvanteConflictMappings
		diff = {
			ours = "co",
			theirs = "ct",
			all_theirs = "ca",
			both = "cb",
			cursor = "cc",
			next = "]x",
			prev = "[x",
		},
		suggestion = {
			accept = "<M-a>",
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
		jump = {
			next = "<C-n>",
			prev = "<C-p>",
		},
		submit = {
			normal = "<CR>",
			insert = "<C-s>",
		},
		cancel = {
			normal = { "<C-c>", "<Esc>", "q" },
			insert = { "<C-c>" },
		},
		sidebar = {
			apply_all = "A",
			apply_cursor = "a",
			retry_user_request = "r",
			edit_user_request = "e",
			switch_windows = "<C-j>",
			reverse_switch_windows = "<C-k>",
			remove_file = "d",
			add_file = "@",
			close = { "<Esc>", "q" },
			close_from_input = {
				normal = "q",
			},
		},
	},
	windows = {
		---@type "right" | "left" | "top" | "bottom"
		position = "right",
		wrap = true,
		width = 30,
		sidebar_header = {
			enabled = true,
			align = "center",
			rounded = true,
		},
	},
}

SinkVim.keymap({ "n", "v" }, "<leader>aa", "<cmd>AvanteAsk<CR>", "Ask Avate")
SinkVim.keymap("n", "<leader>ac", "<cmd>AvanteChat<CR>", "Chat with Avante")
SinkVim.keymap({ "n", "v" }, "<leader>ae", "<cmd>AvanteEdit<CR>", "Edit Avante")
SinkVim.keymap("n", "<leader>af", "<cmd>AvanteFocus<CR>", "Focus Avante")
SinkVim.keymap("n", "<leader>ah", "<cmd>AvanteHistory<CR>", "Avante History")
SinkVim.keymap("n", "<leader>am", "<cmd>AvanteModels<CR>", "Select Avante Model")
SinkVim.keymap("n", "<leader>an", "<cmd>AvanteChatNew<CR>", "New Avante Chat")
SinkVim.keymap("n", "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", "Switch Avante Provider")
SinkVim.keymap("n", "<leader>ar", "<cmd>AvanteRefresh<CR>", "Refresh Avante")
SinkVim.keymap("n", "<leader>as", "<cmd>AvanteStop<CR>", "Stop Avante")
SinkVim.keymap("n", "<leader>at", "<cmd>AvanteToggle<CR>", "Toggle Avante")
SinkVim.keymap("n", "<leader>ac", "<cmd>AvanteClear<CR>", "Avante Clear")

require("avante").setup(opts)
