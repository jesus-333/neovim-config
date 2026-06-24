-- Custome module that support different backend for ghost text completion. Written with claude

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]
-- Get all configured backend

local M = {}

local function load_backends()
  local backends, list = {}, {}
  local files = vim.api.nvim_get_runtime_file(
    "lua/default/custom_functions/ghost_backend/*.lua", true
  )
  for _, path in ipairs(files) do
    local fname = vim.fn.fnamemodify(path, ":t:r")
    if not fname:match("^_") then  -- skip helpers like _minuet.lua
      local ok, b = pcall(require, "default.custom_functions.ghost_backend." .. fname)
      if ok and b and b.key then
        backends[b.key] = b
        table.insert(list, b)
      end
    end
  end
  table.sort(list, function(a, c) return (a.order or 99) < (c.order or 99) end)
  local order = {}
  for _, b in ipairs(list) do table.insert(order, b.key) end
  return backends, order
end

local backends, order = load_backends()

--[[ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ]]


M.active = order[1]  -- first by order; Copilot if order=1
M.on = false

local function current() return backends[M.active] end

local function disable_all(except)
  for key, b in pairs(backends) do
    if key ~= except then pcall(b.disable) end
  end
end

function M.select()
  vim.ui.select(order, {
    prompt = "Ghost-text backend:",
    format_item = function(key)
      local marker = (key == M.active) and " (active)" or ""
      return backends[key].name .. marker
    end,
  }, function(choice)
    if not choice then return end
    M.active = choice
    M.on = false
    disable_all(choice)
    vim.notify("Ghost-text backend: " .. backends[choice].name)
  end)
end

function M.toggle()
  if M.on then
    pcall(current().disable)
    M.on = false
    vim.notify(current().name .. " suggestions OFF")
  else
    disable_all(M.active)
    pcall(current().enable)
    M.on = true
    vim.notify(current().name .. " suggestions ON")
  end
end

function M.tab()
  local b = current()
  local ok, visible = pcall(b.is_visible)
  if ok and visible then
    b.accept()
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false
    )
  end
end

return M
