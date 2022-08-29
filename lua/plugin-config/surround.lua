local status, surround = pcall(require, "surround")
if not status then
  vim.notify("No found surround")
  return
end

surround.setup({
  mappings_style = "surround",

	pairs = {
    nestable = {
      b = { "(", ")" },
      s = { "[", "]" },
      c = { "{", "}" },
      a = { "<", ">" }
    },
    linear = {
      q = { "'", "'" },
      t = { "`", "`" },
      d = { '"', '"' },
			i = { "*", "*" },
			I = { "**", "**" },
    },
  },
})
