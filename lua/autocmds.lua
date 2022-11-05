-- local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true, })
-- local autocmd = vim.api.nvim_create_autocmd

-- 自动切换输入法
-- autocmd("InsertLeave", {
--   group = myAutoGroup,
--   callback = require("utils.im-select").winInsertLeave,
-- })
-- autocmd("InsertEnter", {
--   group = myAutoGroup,
--   callback = require("utils.im-select").winInsertEnter,
-- })

vim.cmd [[

" telescope
augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

" windows copy
augroup fix_yank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
augroup END

]]
