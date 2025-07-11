local M = {}

-- define events
local lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }

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

-- Add LazyFile event
function M.lazy_file()
	local Event = require("lazy.core.handler.event")
	Event.mappings.LazyFile = { id = "LazyFile", event = lazy_file_events }
	Event.mappings["User LazyFile"] = Event.mappings.LazyFile
end

function M.load(prefix, modules)
	local config = {}
	for _, mod in ipairs(modules) do
		local ok, conf = pcall(require, prefix .. mod)
		if ok and type(conf) == "table" then
			config = vim.tbl_deep_extend("force", config, conf)
		else
			vim.notify("Failed to load module: " .. prefix .. mod, vim.log.levels.WARN)
		end
	end
	return config
end

-- systermCheck
function M.check_sys(sysname)
	return vim.uv.os_uname().sysname:find(sysname) ~= nil
end

function M.has(name)
	return require("lazy.core.config").spec.plugins[name] ~= nil
end

M.actions = {
	-- Native Snippets
	snippet_forward = function()
		if vim.snippet.active({ direction = 1 }) then
			vim.schedule(function()
				vim.snippet.jump(1)
			end)
			return true
		end
	end,
	snippet_stop = function()
		if vim.snippet then
			vim.snippet.stop()
		end
	end,
}

-- LSP
---@param on_attach fun(client:vim.lsp.Client, buffer)
---@param name? string
function M.on_attach(on_attach, name)
	return vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf ---@type number
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and (not name or client.name == name) then
				return on_attach(client, buffer)
			end
		end,
	})
end

function M.on_supports_method(method, callback)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local buffer = args.buf
			if client and client.supports_method and client.supports_method(method) then
				callback(client, buffer)
			end
		end,
	})
end

-- fold
-- optimized treesitter foldexpr for Neovim >= 0.10.0
function M.foldexpr()
	local buf = vim.api.nvim_get_current_buf()
	if vim.b[buf].ts_folds == nil then
		-- as long as we don't have a filetype, don't bother
		-- checking if treesitter is available (it won't)
		if vim.bo[buf].filetype == "" then
			return "0"
		end
		if vim.bo[buf].filetype:find("dashboard") then
			vim.b[buf].ts_folds = false
		else
			vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
		end
	end
	return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or "0"
end

local function fold_virt_text(result, start_text, lnum)
  local text = ''
  local hl
  for i = 1, #start_text do
    local char = start_text:sub(i, i)
    local captured_highlights = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
    local outmost_highlight = captured_highlights[#captured_highlights]
    if outmost_highlight then
      local new_hl = '@' .. outmost_highlight.capture
      if new_hl ~= hl then
        -- as soon as new hl appears, push substring with current hl to table
        table.insert(result, { text, hl })
        text = ''
        hl = nil
      end
      text = text .. char
      hl = new_hl
    else
      text = text .. char
    end
  end
  table.insert(result, { text, hl })
end

function M.foldtext()
  local start_text = vim.fn.getline(vim.v.foldstart):gsub('\t', string.rep(' ', vim.o.tabstop))
  local nline = vim.v.foldend - vim.v.foldstart
  local result = {}
  fold_virt_text(result, start_text, vim.v.foldstart - 1)
  table.insert(result, { ' ', nil })
  table.insert(result, { '', '@comment.warning.gitcommit' })
  table.insert(result, { '↙ ' .. nline .. ' lines', '@comment.warning' })
  table.insert(result, { '', '@comment.warning.gitcommit' })
  return result
end

return M
