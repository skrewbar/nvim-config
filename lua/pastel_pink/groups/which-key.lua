local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.pink },
    WhichKeyGroup     = { fg = c.blue5 },
    WhichKeyDesc      = { fg = c.pink_pastel },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyNormal     = { bg = c.bg_sidebar },
    WhichKeyValue     = { fg = c.pink },
  }
end

return M
