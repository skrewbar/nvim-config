local M = {}

M.url = "https://github.com/nvimdev/dashboard-nvim"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- General
    DashboardHeader           = { fg = c.pink },
    DashboardFooter           = { fg = c.pink_light },
    -- Hyper theme
    DashboardProjectTitle     = { fg = c.cyan },
    DashboardProjectTitleIcon = { fg = c.orange },
    DashboardProjectIcon      = { fg = c.yellow },
    DashboardMruTitle         = { fg = c.cyan },
    DashboardMruIcon          = { fg = c.purple },
    DashboardFiles            = { fg = c.pink },
    DashboardShortCutIcon     = { fg = c.magenta },
    -- Doome theme
    DashboardDesc             = { fg = c.cyan },
    DashboardKey              = { fg = c.orange },
    DashboardIcon             = { fg = c.cyan },
    DashboardShortCut         = { fg = c.cyan },
  }
end

return M
