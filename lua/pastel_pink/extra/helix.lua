local util = require("pastel_pink.util")

local M = {}

---@param t table
---@return table
function M.flatten(t)
  local ret = {}
  local function flatten(tbl, prefix)
    for k, v in pairs(tbl) do
      local key = prefix and (prefix .. "." .. k) or k
      if type(v) == "table" and not v[1] then
        flatten(v, key)
      else
        ret[key] = v
      end
    end
  end
  flatten(t)
  return ret
end

--- @param colors ColorScheme
function M.generate(colors)
  -- Ref: https://github.com/helix-editor/helix/blob/master/book/src/themes.md
  local mapping = M.flatten({
    attribute = "@attribute",
    type = {
      "Type",
      builtin = "@type.builtin",
      enum = {
        "@lsp.type.enum",
        variant = "@lsp.type.enumMember",
      },
    },
    constructor = "Type",
    constant = {
      "Constant",
      builtin = {
        "@constant.builtin",
        boolean = "Boolean",
      },
      character = {
        "Character",
        escape = "@string.escape",
      },
      numeric = {
        "Number",
        float = "Float",
        integer = "Number",
      },
    },
    string = {
      "String",
      regexp = "@string.regexp",
      special = {
        "@string.special",
      },
    },
    comment = {
      "@comment",
      block = {
        documentation = "@string.documentation",
      },
    },
    variable = {
      "@variable",
      builtin = "@variable.builtin",
      parameter = "@variable.parameter",
      other = {
        member = "@variable.member",
      },
    },
    label = "@label",
    keyword = {
      "@keyword",
      control = {
        "Statement",
        conditional = "Conditional",
        ["repeat"] = "Repeat",
        ["return"] = "@keyword.return",
        exception = "Exception",
      },
      operator = "Statement",
      directive = "PreProc",
      ["function"] = "@keyword.function",
    },
    operator = "Operator",
    ["function"] = {
      "Function",
      builtin = "@function.builtin",
      method = "@function.method",
      macro = "@function.macro",
      special = "PreProc",
    },
    tag = {
      "@tag",
    },
    namespace = "@lsp.type.namespace",
    special = "Special",
    markup = {
      heading = {
        "@markup.heading",
      },
      list = {
        "@markup.list",
      },
      bold = "Bold",
      italic = "Italic",
      strikethrough = {
        "helix",
        modifiers = { "crossed_out" },
      },
      link = {
        "@markup.link",
        url = "@markup.link.url",
        label = "@markup.link.label",
        text = "@markup.link",
      },
      raw = {
        "@markup.raw",
        inline = "@markup.raw.markdown_inline",
      },
    },
    diff = {
      plus = "diffAdded",
      minus = "diffRemoved",
      delta = {
        "diffChanged",
        moved = "diffFile",
      },
    },
  })

  local theme = {
    ["ui.background"] = { bg = "bg" },
    ["ui.cursor"] = { fg = "bg", bg = "fg" },
    ["ui.selection"] = { bg = "bg_visual" },
    ["ui.linenr"] = { fg = "fg_gutter" },
    ["ui.statusline"] = { fg = "fg", bg = "bg_statusline" },
  }

  for k, v in pairs(mapping) do
    if type(v) == "string" then
      theme[k] = v
    end
  end

  return vim.json.encode(theme)
end

return M
