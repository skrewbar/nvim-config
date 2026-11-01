return {
  "nvim-mini/mini.pairs",
  opts = {
    mappings = {
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w\\].", register = { cr = false } },
    },
  },
}
