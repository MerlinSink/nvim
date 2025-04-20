local M = {}

---@param list table<string>
---@return table<string>
function M.dedup(list)
  local seen = {}
  local result = {}
  for _, i in ipairs(list) do
    if not seen[i] then
      table.insert(result, i)
      seen[i] = true
    end
  end
  return result
end

return M

