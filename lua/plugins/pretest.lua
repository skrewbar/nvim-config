return {
  {
    "skrewbar/pretest.nvim",
    name = "pretest.nvim",
    cmd = "Pretest",
    keys = {
      { "<leader>j", "<cmd>Pretest<cr>", desc = "Pretest" },
    },
    opts = {
      save_dir = vim.fn.expand("~/Programming/.pretest"),
      languages = {
        cpp = {
          compile = {
            exec = "g++-16",
            args = { "-std=gnu++23", "-O2", "-o", "$bin", "$src" },
          },
        },
        ruby = {
          run = {
            exec = "ruby",
            args = { "$src" },
          },
        },
      },
      companion = { problem_path = "{cwd}/{file}.{ext}" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>j", icon = "󰤑" },
        {
          real = true,
          { "<C-n>", mode = { "n", "i" }, icon = "󰑐" },
          { "<C-p>", mode = { "n", "i" }, icon = "󰑐" },
          { "<Tab>", mode = { "n", "i" }, icon = "󰘳" },
          { "<S-Tab>", mode = { "n", "i" }, icon = "󰘵" },
          { "<S-CR>", icon = "󰐊" },
          { "<CR>", icon = "󰑮" },
          { "g<S-CR>", icon = "󰓦" },
          { "g<CR>", icon = "󰑮" },
          { "<C-c>", icon = "󰓛" },
          { "s", icon = "󰓛" },
          { "a", icon = "󰐕" },
          { "d", icon = "󰆴" },
          { "?", icon = "󰋖" },
          { "q", icon = "󰅖" },
        },
      },
    },
  },
}
