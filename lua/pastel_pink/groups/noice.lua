local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type pastel_pink.HighlightsFn
function M.get(c)
  -- stylua: ignore
  local ret = {
    NoiceCmdline                   = { fg = c.yellow },
    NoiceCmdlinePrompt             = { fg = c.yellow },
    NoiceCmdlineIconInput          = { fg = c.yellow },
    NoiceCmdlineIconLua            = { fg = c.yellow },
    NoiceCmdlinePopupBorderInput   = { fg = c.yellow },
    NoiceCmdlinePopupBorderLua     = { fg = c.yellow },
    NoiceCmdlinePopupTitleInput    = { fg = c.yellow },
    NoiceCmdlinePopupTitleLua      = { fg = c.yellow },
    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
  }
  require("pastel_pink.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
  return ret
end

return M
