local util = require("pastel_pink.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local tailwindv4 = util.template(
    [[
@theme inline {
  --color-pastel-pink-${_style}-bg: oklch(from ${bg} l c h);
  --color-pastel-pink-${_style}-bg-dark: oklch(from ${bg_dark} l c h);
  --color-pastel-pink-${_style}-bg-dark1: oklch(from ${bg_dark1} l c h);
  --color-pastel-pink-${_style}-bg-float: var(--color-pastel-pink-${_style}-bg-dark);
  --color-pastel-pink-${_style}-bg-highlight: oklch(from ${bg_highlight} l c h);
  --color-pastel-pink-${_style}-bg-popup: var(--color-pastel-pink-${_style}-bg-dark);
  --color-pastel-pink-${_style}-bg-search: var(--color-pastel-pink-${_style}-blue0);
  --color-pastel-pink-${_style}-bg-sidebar: var(--color-pastel-pink-${_style}-bg-dark);
  --color-pastel-pink-${_style}-bg-statusline: var(--color-pastel-pink-${_style}-bg-dark);
  --color-pastel-pink-${_style}-bg-visual: oklch(from ${bg_visual} l c h);
  --color-pastel-pink-${_style}-black: oklch(from ${black} l c h);
  --color-pastel-pink-${_style}-black-bright: oklch(from ${terminal.black_bright} l c h);
  --color-pastel-pink-${_style}-blue: oklch(from ${blue} l c h);
  --color-pastel-pink-${_style}-blue-bright: oklch(from ${terminal.blue_bright} l c h);
  --color-pastel-pink-${_style}-blue0: oklch(from ${blue0} l c h);
  --color-pastel-pink-${_style}-blue1: oklch(from ${blue1} l c h);
  --color-pastel-pink-${_style}-blue2: oklch(from ${blue2} l c h);
  --color-pastel-pink-${_style}-blue5: oklch(from ${blue5} l c h);
  --color-pastel-pink-${_style}-blue6: oklch(from ${blue6} l c h);
  --color-pastel-pink-${_style}-blue7: oklch(from ${blue7} l c h);
  --color-pastel-pink-${_style}-border: var(--color-pastel-pink-${_style}-black);
  --color-pastel-pink-${_style}-border-highlight: oklch(from ${border_highlight} l c h);
  --color-pastel-pink-${_style}-comment: oklch(from ${comment} l c h);
  --color-pastel-pink-${_style}-cyan: oklch(from ${cyan} l c h);
  --color-pastel-pink-${_style}-cyan-bright: oklch(from ${terminal.cyan_bright} l c h);
  --color-pastel-pink-${_style}-dark3: oklch(from ${dark3} l c h);
  --color-pastel-pink-${_style}-dark5: oklch(from ${dark5} l c h);
  --color-pastel-pink-${_style}-diff-add: oklch(from ${diff.add} l c h);
  --color-pastel-pink-${_style}-diff-change: oklch(from ${diff.change} l c h);
  --color-pastel-pink-${_style}-diff-delete: oklch(from ${diff.delete} l c h);
  --color-pastel-pink-${_style}-diff-text: var(--color-pastel-pink-${_style}-blue7);
  --color-pastel-pink-${_style}-error: var(--color-pastel-pink-${_style}-red1);
  --color-pastel-pink-${_style}-fg: oklch(from ${fg} l c h);
  --color-pastel-pink-${_style}-fg-dark: oklch(from ${fg_dark} l c h);
  --color-pastel-pink-${_style}-fg-float: var(--color-pastel-pink-${_style}-fg);
  --color-pastel-pink-${_style}-fg-gutter: oklch(from ${fg_gutter} l c h);
  --color-pastel-pink-${_style}-fg-sidebar: var(--color-pastel-pink-${_style}-fg-dark);
  --color-pastel-pink-${_style}-git-add: oklch(from ${git.add} l c h);
  --color-pastel-pink-${_style}-git-change: oklch(from ${git.change} l c h);
  --color-pastel-pink-${_style}-git-delete: oklch(from ${git.delete} l c h);
  --color-pastel-pink-${_style}-git-ignore: var(--color-pastel-pink-${_style}-dark3);
  --color-pastel-pink-${_style}-green: oklch(from ${green} l c h);
  --color-pastel-pink-${_style}-green-bright: oklch(from ${terminal.green_bright} l c h);
  --color-pastel-pink-${_style}-green1: oklch(from ${green1} l c h);
  --color-pastel-pink-${_style}-green2: oklch(from ${green2} l c h);
  --color-pastel-pink-${_style}-hint: var(--color-pastel-pink-${_style}-teal);
  --color-pastel-pink-${_style}-info: var(--color-pastel-pink-${_style}-blue2);
  --color-pastel-pink-${_style}-magenta: oklch(from ${magenta} l c h);
  --color-pastel-pink-${_style}-magenta-bright: oklch(from ${terminal.magenta_bright} l c h);
  --color-pastel-pink-${_style}-magenta2: oklch(from ${magenta2} l c h);
  --color-pastel-pink-${_style}-orange: oklch(from ${orange} l c h);
  --color-pastel-pink-${_style}-purple: oklch(from ${purple} l c h);
  --color-pastel-pink-${_style}-rainbow1: var(--color-pastel-pink-${_style}-blue);
  --color-pastel-pink-${_style}-rainbow2: var(--color-pastel-pink-${_style}-yellow);
  --color-pastel-pink-${_style}-rainbow3: var(--color-pastel-pink-${_style}-green);
  --color-pastel-pink-${_style}-rainbow4: var(--color-pastel-pink-${_style}-teal);
  --color-pastel-pink-${_style}-rainbow5: var(--color-pastel-pink-${_style}-magenta);
  --color-pastel-pink-${_style}-rainbow6: var(--color-pastel-pink-${_style}-purple);
  --color-pastel-pink-${_style}-rainbow7: var(--color-pastel-pink-${_style}-orange);
  --color-pastel-pink-${_style}-rainbow8: var(--color-pastel-pink-${_style}-red);
  --color-pastel-pink-${_style}-red: oklch(from ${red} l c h);
  --color-pastel-pink-${_style}-red-bright: oklch(from ${terminal.red_bright} l c h);
  --color-pastel-pink-${_style}-red1: oklch(from ${red1} l c h);
  --color-pastel-pink-${_style}-teal: oklch(from ${teal} l c h);
  --color-pastel-pink-${_style}-todo: var(--color-pastel-pink-${_style}-blue);
  --color-pastel-pink-${_style}-warning: var(--color-pastel-pink-${_style}-yellow);
  --color-pastel-pink-${_style}-yellow: oklch(from ${yellow} l c h);
  --color-pastel-pink-${_style}-yellow-bright: oklch(from ${terminal.yellow_bright} l c h);
}]],
    colors
  )

  return tailwindv4
end

return M
