return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    local cpp = require("config.helper.cpp")

    require("competitest").setup({
      testcases_use_single_file = true,

      compile_command = {
        cpp = {
          exec = cpp.compiler(),
          args = {
            "-std=gnu++23",
            "-Wall",
            "$(FNAME)",
            "-O2",
            "-o",
            "$(FNOEXT).out",
          },
        },
      },

      run_command = {
        cpp = { exec = "./$(FNOEXT).out" },
        python = { exec = "python3", args = { "$(FNAME)" } },
      },
    })
  end,
}
