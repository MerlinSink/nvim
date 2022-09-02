local M = {}

M.defaultIM = "com.apple.keylayout.ABC"
M.currentIM = M.defaultIM

M.winInsertLeave = function()
  M.currentIM = vim.fn.system({ "im-select" })
  vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
end

M.winInsertEnter = function()
  if M.currentIM then
    vim.cmd(":silent :!im-select" .. " " .. M.currentIM)
  else
    vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
  end
end

M.windowsInsertLeave = function()
  vim.cmd(":silent :!D:\\Application\\Scoop\\apps\\im-select\\current\\im-select.exe 1033")
end

M.windowsInsertEnter = function()
  vim.cmd(":silent :!D:\\Application\\Scoop\\apps\\im-select\\current\\im-select.exe 2052")
end
return M


