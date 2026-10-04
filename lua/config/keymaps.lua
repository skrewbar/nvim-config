-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_user_command("Dashboard", function()
  ---@diagnostic disable-next-line: missing-fields
  Snacks.dashboard({ win = vim.api.nvim_get_current_win() })
end, { desc = "Open dashboard in current window" })
