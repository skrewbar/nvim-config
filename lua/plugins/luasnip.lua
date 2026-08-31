return {
  "L3MON4D3/LuaSnip",
  opts = function(_, opts)
    local vscode_loader = require("luasnip.loaders.from_vscode")
    local luasnip = require("luasnip")
    local loaded_paths = {} ---@type string[]

    local function is_paths_equal(a, b)
      if #a ~= #b then
        return false
      end

      for i = 1, #a do
        if a[i] ~= b[i] then
          return false
        end
      end
      return true
    end

    local function find_vscode_dirs(cwd)
      local root = LazyVim.norm(LazyVim.root.get({ normalize = true }))
      local norm_cwd = LazyVim.norm(cwd or vim.uv.cwd() or ".")
      local home = LazyVim.norm(vim.uv.os_homedir())
      local start = (norm_cwd == root or vim.startswith(norm_cwd, root .. "/")) and norm_cwd or root
      local stop = LazyVim.norm(vim.fs.dirname(root))

      local dirs = vim.fs.find(".vscode", {
        upward = true,
        path = start,
        type = "directory",
        limit = math.huge,
        stop = stop,
      })

      local filtered = {}
      for _, dir in ipairs(dirs) do
        local norm_dir = LazyVim.norm(dir)
        if LazyVim.norm(vim.fs.dirname(norm_dir)) ~= home then
          filtered[#filtered + 1] = norm_dir
        end
      end

      table.sort(filtered)
      return filtered
    end

    local function load_workspace_snippets(cwd)
      local dirs = find_vscode_dirs(cwd)
      if is_paths_equal(dirs, loaded_paths) then
        return
      end

      if #loaded_paths > 0 then
        luasnip.cleanup()
      end

      loaded_paths = dirs

      if #dirs > 0 then
        vscode_loader.lazy_load({
          paths = dirs,
        })
      end
    end

    load_workspace_snippets()

    local group = vim.api.nvim_create_augroup("workspace_luasnip", { clear = true })

    vim.api.nvim_create_autocmd("DirChanged", {
      group = group,
      callback = function(event)
        load_workspace_snippets(event.file)
      end,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "LspAttach" }, {
      group = group,
      callback = function()
        load_workspace_snippets()
      end,
    })

    return opts
  end,
}
