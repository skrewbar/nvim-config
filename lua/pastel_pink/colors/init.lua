local Util = require("pastel_pink.util")

local M = {}

---@type table<string, Palette|fun(opts:pastel_pink.Config):Palette>
M.styles = {
  pastel_pink = Util.mod("pastel_pink.colors.pastel_pink"),
}

---@param opts? pastel_pink.Config
function M.setup(opts)
  opts = require("pastel_pink.config").extend(opts)

  local palette = M.styles[opts.style]
  if not palette then
    opts.style = "pastel_pink"
    palette = M.styles[opts.style]
  end
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Palette]]
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  colors.diff = {
    add = Util.blend_bg(colors.green2, 0.25),
    delete = Util.blend_bg(colors.red1, 0.25),
    change = Util.blend_bg(colors.pink_deep, 0.15),
    text = colors.pink_deep,
  }

  colors.git.ignore = colors.dark3
  colors.black = Util.blend_bg(colors.bg, 0.8, "#000000")
  colors.border_highlight = Util.blend_bg(colors.pink_light, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = Util.blend_bg(colors.pink_pastel, 0.28)
  colors.bg_selection = Util.blend(colors.bg_visual, 0.3, colors.bg2)
  colors.bg_tree_selection = "#544242"
  colors.bg_search = Util.blend_bg(colors.pink_pastel, 0.5)
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.error = colors.red1
  colors.todo = colors.pink
  colors.warning = colors.yellow
  colors.info = colors.pink_light
  colors.hint = colors.teal

  colors.rainbow = {
    colors.blue,
    colors.yellow,
    colors.green,
    colors.teal,
    colors.magenta,
    colors.purple,
    colors.orange,
    colors.red,
  }

  -- stylua: ignore
  --- @class TerminalColors
  colors.terminal = {
    black          = "#272222",
    black_bright   = "#7a6a6a",
    red            = "#ff8787",
    red_bright     = "#ffaeae",
    green          = "#83ff99",
    green_bright   = "#aeffbb",
    yellow         = "#ffeb86",
    yellow_bright  = "#fff5b0",
    blue           = "#8bd1ff",
    blue_bright    = "#abdcff",
    magenta        = "#ff7ca6",
    magenta_bright = "#ffb9ce",
    cyan           = "#80ffd2",
    cyan_bright    = "#abffe3",
    white          = "#cbbebe",
    white_bright   = "#ffeeee",
  }

  opts.on_colors(colors)

  return colors, opts
end

return M
