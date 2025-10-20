return {
	---@class snacks.dashboard.Config
	dashboard = {
		enabled = true,
		width = 60,
		row = nil, -- dashboard position. nil for center
		col = nil, -- dashboard position. nil for center
		pane_gap = 4, -- empty columns between vertical panes
		preset = {
			header =
				-- [[
				-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
				-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
				-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
				-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
				-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
				-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
				-- ]],
				[[
           _____ _       __  _    ___
          / ___/(_)___  / /_| |  / (_)___ ___
          \__ \/ / __ \/ //_/ | / / / __ `__ \
         ___/ / / / / / ,<  | |/ / / / / / / /
        /____/_/_/ /_/_/|_| |___/_/_/ /_/ /_/
        ]],
        -- [[
        --  ███████╗██╗███╗   ██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
        -- ██╔════╝██║████╗  ██║██║ ██╔╝██║   ██║██║████╗ ████║
        -- ███████╗██║██╔██╗ ██║█████╔╝ ██║   ██║██║██╔████╔██║
        -- ╚════██║██║██║╚██╗██║██╔═██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
        -- ███████║██║██║ ╚████║██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
        -- ╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
        -- ]],
      -- stylua: ignore start
      ---@type snacks.dashboard.Item[]
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
			-- stylua: ignore end
		},
		sections = {
			{
				section = "terminal",
				cmd = "chafa C:\\Users\\lenovo\\Pictures\\Wallpaper\\001.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
				height = 17,
				padding = 1,
			},
			{
				pane = 2,
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
