local M = {}
local Util = require("pastel_pink.util")

M.url = "https://github.com/Saghen/blink.cmp"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    BlinkCmpDoc                 = { fg = c.fg, bg               = c.bg_float },
    BlinkCmpDocBorder           = { fg = c.border_highlight, bg = c.bg_float },
    BlinkCmpGhostText           = { fg = Util.blend_bg(c.fg_dark, 0.40) },
    BlinkCmpKindCodeium         = { fg = c.teal, bg             = c.none },
    BlinkCmpKindCopilot         = { fg = c.teal, bg             = c.none },
    BlinkCmpKindDefault         = { fg = c.fg_dark, bg          = c.none },
    BlinkCmpKindSupermaven      = { fg = c.teal, bg             = c.none },
    BlinkCmpKindTabNine         = { fg = c.teal, bg             = c.none },
    BlinkCmpLabel               = { fg = c.fg, bg               = c.none },
    BlinkCmpLabelDeprecated     = { fg = c.fg_gutter, bg        = c.none, strikethrough = true },
    BlinkCmpLabelMatch          = { fg = c.pink_pastel, bg            = c.none },
    BlinkCmpMenu                = { fg = c.fg, bg               = c.bg_float },
    BlinkCmpMenuBorder          = { fg = c.border_highlight, bg = c.bg_float },
    BlinkCmpMenuSelection       = { bg = c.bg_selection },
    BlinkCmpSignatureHelp       = { fg = c.fg, bg               = c.bg_float },
    BlinkCmpSignatureHelpBorder = { fg = c.border_highlight, bg = c.bg_float },
  }

  require("tokyonight.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
