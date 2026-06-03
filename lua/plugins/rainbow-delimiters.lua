return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      strategy = {
        default = rainbow_delimiters.strategy["global"],
      },
      query = {
        default = "rainbow-delimiters",
        lua = "rainbow-delimiters",
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterOrange",
        "RainbowDelimiterYellow",
        "RainbowDelimiterGreen",
        "RainbowDelimiterBlue",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
