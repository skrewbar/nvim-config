local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentLine                 = { fg = c.fg_gutter, nocombine = true },
    IndentLineCurrent          = { fg = c.pink_light, nocombine = true },
  }
end

return M
