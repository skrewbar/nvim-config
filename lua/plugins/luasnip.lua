return {
  "L3MON4D3/LuaSnip",
  opts = function(_, opts)
    local vscode_loader = require("luasnip.loaders.from_vscode")

    local function load_workspace_snippets(cwd)
      local path = vim.fs.joinpath(cwd or vim.fn.getcwd(), ".vscode")
      local stat = vim.uv.fs_stat(path)

      if stat and stat.type == "directory" then
        vscode_loader.lazy_load({
          paths = { path },
        })
      end
    end

    load_workspace_snippets()

    vim.api.nvim_create_autocmd("DirChanged", {
      group = vim.api.nvim_create_augroup("workspace_luasnip", { clear = true }),
      callback = function(event)
        load_workspace_snippets(event.file)
      end,
    })

    return opts
  end,
}
