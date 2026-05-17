-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local build_commands = {
  cpp = function()
    local file = vim.fn.expand("%:p")
    local outfile = vim.fn.expand("%:p:r") .. ".out"

    vim.cmd("write")

    vim.fn.jobstart({
      "g++-15",
      "-std=gnu++23",
      "-Wall",
      "-g",
      "-O0",
      file,
      "-o",
      outfile,
    }, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data and #data > 0 then
          print(table.concat(data, "\n"))
        end
      end,
      on_stderr = function(_, data)
        if data and #data > 0 then
          print(table.concat(data, "\n"))
        end
      end,
      on_exit = function(_, code)
        if code == 0 then
          vim.notify("Build success: " .. outfile)
        else
          vim.notify("Build failed", vim.log.levels.ERROR)
        end
      end,
    })
  end,
}

vim.keymap.set("n", "<leader>cb", function()
  local ft = vim.bo.filetype
  local build = build_commands[ft]

  if build then
    build()
  else
    vim.notify("No build command for filetype: " .. ft, vim.log.levels.WARN)
  end
end, { desc = "Build current file" })
