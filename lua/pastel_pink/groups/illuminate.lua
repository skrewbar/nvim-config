local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

---@type pastel_pink.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    IlluminatedWordRead  = { bg = "#544242" },
    IlluminatedWordText  = { bg = "#544242" },
    IlluminatedWordWrite = { bg = "#544242" },
    illuminatedCurWord   = { bg = "#544242" },
    illuminatedWord      = { bg = "#544242" },
  }
end

return M
