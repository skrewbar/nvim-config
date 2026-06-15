local util = require("pastel_pink.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local kitty = util.template(
    [[
# vim:ft=kitty

## name: ${_style_name}
## license: MIT
## author: Pastel Pink
## upstream: ${_upstream_url}

background ${bg}
foreground ${fg}
selection_background ${bg_visual}
selection_foreground ${fg}
url_color ${green1}
cursor ${fg}
cursor_text_color ${bg}

# Tabs
active_tab_background ${blue}
active_tab_foreground ${bg_dark}
inactive_tab_background ${bg_dark}
inactive_tab_foreground ${fg_dark}
tab_bar_background ${bg_dark1}

# Windows
active_border_color ${blue}
inactive_border_color ${bg_highlight}
bell_border_color ${yellow}

# Colors
color0 ${black}
color1 ${red}
color2 ${green}
color3 ${yellow}
color4 ${blue}
color5 ${magenta}
color6 ${cyan}
color7 ${fg_dark}

color8 ${terminal_black}
color9 ${red}
color10 ${green}
color11 ${yellow}
color12 ${blue}
color13 ${magenta}
color14 ${cyan}
color15 ${fg}
]],
    colors
  )

  return kitty
end

return M
