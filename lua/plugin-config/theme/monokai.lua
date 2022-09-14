local status_ok, monokai = pcall(require, "monokai")
local palette = monokai.classic
if not status_ok then
    vim.notify("No found monokai")
  return
end

monokai.setup({
	palette = {
        diff_text = '#133337',
    },
    custom_hlgroups = {
        TSInclude = {
            fg = palette.aqua,
        },
        GitSignsAdd = {
            fg = palette.green,
            bg = palette.base2
        },
        GitSignsDelete = {
            fg = palette.pink,
            bg = palette.base2
        },
        GitSignsChange = {
            fg = palette.orange,
            bg = palette.base2
        },
    }
})
