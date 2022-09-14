local status_ok, surround = pcall(require, "surround")
if not status_ok then
  vim.notify("No found surround")
  return
end

surround.setup({
  mappings_style = "surround",

	pairs = {
    nestable = require("keymaps").nestableList,

		linear = require("keymaps").linearList,

	},
})
