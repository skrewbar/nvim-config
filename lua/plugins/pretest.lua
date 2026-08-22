return {
  dir = vim.fn.expand("~/Programming/pretest.nvim"),
  name = "pretest.nvim",
  cmd = "Pretest",
  keys = {
    { "<leader>tu", "<cmd>Pretest toggle<cr>", desc = "Toggle UI" },
    { "<leader>tt", "<cmd>Pretest toggle_layout<cr>", desc = "Toggle sidebar/float" },
    { "<leader>tR", "<cmd>Pretest run<cr>", desc = "Run all testcases" },
    { "<leader>tr", "<cmd>Pretest run_current<cr>", desc = "Run current testcase" },
    { "<leader>tn", "<cmd>Pretest run_current_no_compile<cr>", desc = "Run current testcase (no compile)" },
    { "<leader>t<S-n>", "<cmd>Pretest run_no_compile<cr>", desc = "Run all (no compile)" },
    { "<leader>ts", "<cmd>Pretest stop<cr>", desc = "Stop run" },
    { "<leader>ta", "<cmd>Pretest add<cr>", desc = "Add testcase" },
    { "<leader>te", "<cmd>Pretest edit<cr>", desc = "Edit/Focus" },
    { "<leader>td", "<cmd>Pretest delete<cr>", desc = "Delete testcase" },
  },
  config = function(_, opts)
    require("pretest").setup(opts)
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>t", group = "Pretest", icon = "󰤑" },
        { "<leader>tu", icon = "󰖷" },
        { "<leader>tt", icon = "󰖯" },
        { "<leader>tR", icon = "󰐊" },
        { "<leader>tr", icon = "󰑮" },
        { "<leader>tn", icon = "󰑮" },
        { "<leader>t<S-n>", icon = "󰓦" },
        { "<leader>ts", icon = "󰓛" },
        { "<leader>ta", icon = "󰐕" },
        { "<leader>te", icon = "󰏫" },
        { "<leader>td", icon = "󰆴" },
      })
    end
  end,
  opts = {
    save_dir = vim.fn.expand("~/Programming/.pretest"),
    languages = {
      cpp = {
        compile = {
          exec = "g++-16",
          args = { "-std=gnu++23", "-O2", "-o", "$bin", "$src" },
        },
      },
    },
  },
}
