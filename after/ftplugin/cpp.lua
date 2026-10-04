-- C++ build
vim.keymap.set("n", "<localleader>b", function()
  local file = vim.fn.expand("%:p")
  local outfile = vim.fn.expand("%:p:r") .. ".out"
  local compiler = vim.fn.executable("g++-16") == 1 and "g++-16" or "g++"

  vim.cmd("write")

  vim.fn.jobstart({
    compiler,
    "-std=gnu++23",
    "-D_GLIBCXX_DEBUG",
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
end, { buffer = true, desc = "Build current C++ file" })
