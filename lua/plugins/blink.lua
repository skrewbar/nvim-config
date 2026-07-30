return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.sources.default = { "lsp", "snippets" }

    opts.keymap = {
      preset = "super-tab",
    }
  end,
}
