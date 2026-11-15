-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.title = true

-- languages
-- ruby
vim.g.lazyvim_ruby_lsp = "solargraph"
vim.g.lazyvim_ruby_formatter = "rufo"

-- python
vim.g.lazyvim_python_lsp = "basedpyright"
