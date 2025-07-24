return {
	"CRAG666/code_runner.nvim",
	event = "VeryLazy",
  keys ={
		{ "<leader>rr", function() require("code_runner").run_code() end, desc = "Run Code" },
		{ "<leader>rf", function() require("code_runner").run_from_fn() end, desc = "Run File" },
		{ "<leader>rft", function() require("code_runner").run_filetype() end, desc = "Run FileType" },
		{ "<leader>rp", function() require("code_runner").run_project() end, desc = "Run Project" },
		{ "<leader>rc", function() require("code_runner").run_close() end, desc = "Run Close" },
		{ "<leader>rgf", function() require("code_runner").get_filetype_command() end, desc = "Get FileType Command" },
		{ "<leader>rgp", function() require("code_runner").get_project_command() end, desc = "Get Project Command" },
  },
	opts = {
		filetype = {
			-- java = {
			-- 	"cd $dir &&",
			-- 	"javac $fileName &&",
			-- 	"java $fileNameWithoutExt",
			-- },
			python = "python3 -u",
			-- typescript = "deno run",
			-- rust = {
			-- 	"cd $dir &&",
			-- 	"rustc $fileName &&",
			-- 	"$dir/$fileNameWithoutExt",
			-- },
			c = function()
				local c_base = {
					"cd $dir &&",
					"gcc $fileName -o",
					"/tmp/$fileNameWithoutExt",
				}
				local c_exec = {
					"&& /tmp/$fileNameWithoutExt &&",
					"rm /tmp/$fileNameWithoutExt",
				}
				vim.ui.input({ prompt = "Add more args:" }, function(input)
					c_base[4] = input
					vim.print(vim.tbl_extend("force", c_base, c_exec))
					require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
				end)
			end,
			cs = function()
				local root_dir = require("lspconfig").util.root_pattern("*.csproj")(vim.loop.cwd())
				local items = {
					{ cmd = { "cd " .. root_dir .. " && dotnet build$end" }, display = "🛠  Build" },
					{ cmd = { "cd " .. root_dir .. " && dotnet run$end" }, display = "🚀  Run" },
				}

				if Snacks then
					Snacks.picker.select(items, {
						prompt = "C#",
						format_item = function(item)
							return item.display
						end,
						layout = "vscode",
					}, function(choice)
						if choice then
							require("code_runner.commands").run_from_fn(choice.cmd)
						end
					end)
				end
			end,
		},
	},
}
