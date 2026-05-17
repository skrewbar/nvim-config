local M = {}

M.url = "https://github.com/glepnir/lspsaga.nvim"

---@type pastel_pink.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    DefinitionCount            = { fg = c.purple },
    DefinitionIcon             = { fg = c.pink },
    DiagnosticInformation      = "DiagnosticInfo",
    DiagnosticWarning          = "DiagnosticWarn",
    LspFloatWinBorder          = { fg = c.border_highlight },
    LspFloatWinNormal          = { bg = c.bg_float },
    LspSagaBorderTitle         = { fg = c.cyan },
    LspSagaCodeActionBorder    = { fg = c.pink },
    LspSagaCodeActionContent   = { fg = c.purple },
    LspSagaCodeActionTitle     = { fg = c.blue1 },
    LspSagaDefPreviewBorder    = { fg = c.green },
    LspSagaFinderSelection     = { fg = c.bg_visual },
    LspSagaHoverBorder         = { fg = c.pink },
    LspSagaRenameBorder        = { fg = c.green },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount            = { fg = c.purple },
    ReferencesIcon             = { fg = c.pink },
    TargetWord                 = { fg = c.cyan },
  }
end

return M
