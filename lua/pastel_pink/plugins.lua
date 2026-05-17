local function theme()
  return vim.g.colors_name == "pastel-pink" and require("pastel_pink.lualine") or "auto"
end

local function apply_theme(opts)
  opts = opts or {}
  opts.options = opts.options or {}
  opts.options.globalstatus = true
  opts.options.theme = theme()
  return opts
end

return {
  {
    "nvim-lualine/lualine.nvim",
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("pastel_pink_lualine", { clear = true }),
        callback = function()
          if not package.loaded["lualine"] then
            return
          end
          local lualine = require("lualine")
          local config = lualine.get_config()
          apply_theme(config)
          lualine.setup(config)
        end,
      })
    end,
    opts = function(_, opts)
      apply_theme(opts)
    end,
  },
}
