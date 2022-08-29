local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("No found telescope")
  return
end

telescope.setup({
  defaults = {

    initial_mode = "normal",

    mappings = require("keybindings").telescopeList,
  },
  pickers = {

    find_files = {

      -- theme = "dropdown", 
    }
  },
  extensions = {

  },
})
