local config = require("pastel_pink.config")

local M = {}

---@param opts? pastel_pink.Config
function M.load(opts)
  opts = require("pastel_pink.config").extend(opts)
  opts.style = "pastel_pink"
  vim.o.background = "dark"
  return require("pastel_pink.theme").setup(opts)
end

M.setup = config.setup

return M
