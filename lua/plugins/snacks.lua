-- Workaround: snacks explorer keeps showing files committed under a previously
-- untracked directory as untracked, because `dir_status` is never reset.
-- https://github.com/folke/snacks.nvim/pull/2934
-- https://github.com/folke/snacks.nvim/pull/2832
-- Skipped (with a notice) once upstream resets `dir_status` itself.

local function patch_explorer_dir_status(plugin)
  local src = plugin.dir .. "/lua/snacks/explorer/git.lua"
  local ok, lines = pcall(vim.fn.readfile, src)
  if ok and table.concat(lines, "\n"):find("dir_status = nil", 1, true) then
    vim.notify(
      "Upstream fixed the explorer dir_status bug.\nYou can remove lua/plugins/snacks.lua.",
      vim.log.levels.INFO,
      { title = "snacks explorer patch" }
    )
    return
  end

  local Git = require("snacks.explorer.git")
  local update = Git._update
  if type(update) ~= "function" then
    vim.notify(
      "snacks.explorer.git._update not found; patch skipped.\nCheck lua/plugins/snacks.lua.",
      vim.log.levels.WARN,
      { title = "snacks explorer patch" }
    )
    return
  end

  Git._update = function(cwd, results)
    local Tree = require("snacks.explorer.tree")
    Tree:walk(Tree:find(cwd), function(n)
      n.dir_status = nil
    end, { all = true })
    return update(cwd, results)
  end
end

return {
  {
    "folke/snacks.nvim",
    opts = function(plugin)
      patch_explorer_dir_status(plugin)
    end,
  },
}
