local config = require("pastel_pink.config")
local pastel_pink_colors = require("pastel_pink.colors")

local colors = pastel_pink_colors.setup({
  style = "pastel_pink",
})

local hl = {}
local section_bg = colors.bg_highlight

hl.normal = {
  a = { bg = colors.pink, fg = colors.black },
  b = { bg = section_bg, fg = colors.pink },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

hl.insert = {
  a = { bg = colors.orange, fg = colors.black },
  b = { bg = section_bg, fg = colors.orange },
}

hl.command = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = section_bg, fg = colors.blue },
}

hl.visual = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = section_bg, fg = colors.purple },
}

hl.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = section_bg, fg = colors.red },
}

hl.terminal = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = section_bg, fg = colors.green },
}

hl.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.pink },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if config.options.lualine_bold then
  for _, mode in pairs(hl) do
    mode.a.gui = "bold"
  end
end

return hl
