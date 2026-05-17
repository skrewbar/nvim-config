local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AlphaShortcut    = { fg = c.rose },
    AlphaHeader      = { fg = c.pink_light, bold = true },
    AlphaHeaderLabel = { fg = c.pink },
    AlphaFooter      = { fg = c.pink_deep },
    AlphaButtons     = { fg = c.pink },
  }
end

return M
