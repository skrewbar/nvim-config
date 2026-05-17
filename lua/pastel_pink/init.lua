local config = require("pastel_pink.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? pastel_pink.Config
function M.load(opts)
  opts = require("pastel_pink.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.style == "day" and "light" or "dark"

  if bg ~= style_bg then
    if vim.g.colors_name == "pastel-pink-" .. opts.style then
      opts.style = bg == "light" and (M.styles.light or "day") or (M.styles.dark or "pastel_pink")
    else
      vim.o.background = style_bg
    end
  end
  M.styles[vim.o.background] = opts.style
  return require("pastel_pink.theme").setup(opts)
end

M.setup = config.setup

return M
