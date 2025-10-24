return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local keymap = function(mode, keys, func, desc)
			vim.keymap.set(mode, keys, func, { desc = desc })
		end

    -- Add or skip cursor above/below the main cursor.
    -- stylua: ignore start
    keymap({"n", "x"}, "<leader>lj", function() mc.lineAddCursor(1) end, "lineAddCursor Next")
    keymap({"n", "x"}, "<leader>lJ", function() mc.lineSkipCursor(1) end, "lineSkipCursor Next")
    keymap({"n", "x"}, "<leader>lk", function() mc.lineAddCursor(-1) end, "lineAddCursor Preview")
    keymap({"n", "x"}, "<leader>lK", function() mc.lineSkipCursor(-1) end,"lineSkipCursor Preview")
    --
    -- -- Add or skip adding a new cursor by matching word/selection
    keymap({"n", "x"}, "<leader>cj", function() mc.matchAddCursor(1) end, "matchAddCursor Next")
    keymap({"n", "x"}, "<leader>cJ", function() mc.matchSkipCursor(1) end, "matchSkipCursor Next")
    keymap({"n", "x"}, "<leader>ck", function() mc.matchAddCursor(-1) end,"matchAddCursor Preview")
    keymap({"n", "x"}, "<leader>cK", function() mc.matchSkipCursor(-1) end, "matchSkipCursor Preview")
    --
    -- -- Add and remove cursors with control + left click.
    -- keymap("n", "<c-leftmouse>", mc.handleMouse)
    -- keymap("n", "<c-leftdrag>", mc.handleMouseDrag)
    -- keymap("n", "<c-leftrelease>", mc.handleMouseRelease)
    --
    -- -- Disable and enable cursors.
    keymap({"n", "x"}, "<c-q>", mc.toggleCursor)
    --
    -- -- Mappings defined in a keymap layer only apply when there are
    -- -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)

        -- Select a different cursor as the main one.
        -- layerSet({"n", "x"}, "<left>", mc.prevCursor)
        -- layerSet({"n", "x"}, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        -- layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
    end)
		-- stylua: ignore end

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { reverse = true })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { reverse = true })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
