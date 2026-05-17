local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- rainbow-delimiters (using VSCode bracket highlight colors)
    RainbowDelimiterRed    = { fg = c.bracket_level1 },
    RainbowDelimiterOrange = { fg = c.bracket_level2 },
    RainbowDelimiterYellow = { fg = c.bracket_level3 },
    RainbowDelimiterGreen  = { fg = c.bracket_level1 },
    RainbowDelimiterBlue   = { fg = c.bracket_level2 },
    RainbowDelimiterViolet = { fg = c.bracket_level3 },
    RainbowDelimiterCyan   = { fg = c.bracket_level1 },
  }
end

return M
