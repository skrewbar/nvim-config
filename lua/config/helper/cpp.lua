local M = {}

function M.compiler()
  if vim.fn.executable("g++-16") == 1 then
    return "g++-16"
  end
  return "g++"
end

return M
