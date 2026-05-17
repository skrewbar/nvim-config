return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      testcases_use_single_file = true,

      compile_command = {
        cpp = { exec = "g++-15", args = { "-Wall", "$(FNAME)", "-O2", "-o", "$(FNOEXT).out" } },
      },

      run_command = {
        cpp = { exec = "./$(FNOEXT).out" },
      },
    })
  end,
}
