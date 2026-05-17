-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  vim.o.cmdheight = 999

  vim.opt.number = true
  local function toggle_line_numbers()
    local augroup = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
      group = augroup,
      callback = function()
        vim.opt.relativenumber = true
      end,
    })

    vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
      group = augroup,
      callback = function()
        vim.opt.relativenumber = false
      end,
    })
  end

  toggle_line_numbers()
else
  require("config.lazy")
end
