local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.dark3 },
    FlashMatch    = { bg = "#5F5052", fg = c.fg },
    FlashCurrent  = { bg = "#5F5052", fg = c.fg },
    FlashLabel    = { bg = c.magenta2, bold = true, fg = c.black },
  }
end

return M
