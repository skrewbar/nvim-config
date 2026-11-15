local hidden_dirs = vim.tbl_map(vim.fs.normalize, {
  "~/Programming/problem setting",
})

local function is_hidden(path)
  if not path or path == "" then
    return false
  end
  path = vim.fs.normalize(path)
  for _, dir in ipairs(hidden_dirs) do
    if path == dir or vim.startswith(path, dir .. "/") then
      return true
    end
  end
  return false
end

return {
  "vyfor/cord.nvim",
  opts = {
    display = {
      theme = "minecraft",
      flavor = "accent",
    },
    extensions = {
      visibility = {
        rules = {
          blacklist = {
            {
              value = function(opts)
                return is_hidden(opts.workspace_dir)
                  or is_hidden(vim.api.nvim_buf_get_name(0))
                  or is_hidden(vim.fn.getcwd())
              end,
            },
          },
        },
      },
    },
  },
}
