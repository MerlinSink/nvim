local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true, })
local autocmd = vim.api.nvim_create_autocmd
-- 自动切换输入法
autocmd("InsertLeave", {
  group = myAutoGroup,
  callback = require("utils.im-select").winInsertLeave,
})
autocmd("InsertEnter", {
  group = myAutoGroup,
  callback = require("utils.im-select").winInsertEnter,
})

