local M = {}

M.url = "https://github.com/echasnovski/mini.indentscope"

---@type pastel_pink.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniIndentscopeSymbol = { fg = c.pink_light, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible
  }
end

return M
