local status_ok, surround = pcall(require, "surround")
if not status_ok then
  vim.notify("No found surround")
  return
end

surround.setup({
  mappings_style = "surround",

	pairs = {
    nestable = require("keybindings").nestableList,

		linear = require("keybindings").linearList,

	},
})
