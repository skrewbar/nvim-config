-- VSCode-style debugging keymaps
-- Fallbacks like <F17> cover terminals that report modified function keys as xterm F13-F48
return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    -- stylua: ignore
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
      { "<S-F5>", function() require("dap").terminate() end, desc = "Debug: Stop" },
      { "<F17>", function() require("dap").terminate() end, desc = "Debug: Stop" },
      { "<D-S-F5>", function() require("dap").restart() end, desc = "Debug: Restart" },
      { "<C-S-F5>", function() require("dap").restart() end, desc = "Debug: Restart" },
      { "<F41>", function() require("dap").restart() end, desc = "Debug: Restart" },
      { "<F6>", function() require("dap").pause() end, desc = "Debug: Pause" },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<S-F11>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<F23>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<F5>", icon = "󰐊" },
        { "<S-F5>", icon = "󰓛" },
        { "<D-S-F5>", icon = "󰜉" },
        { "<C-S-F5>", icon = "󰜉" },
        { "<F6>", icon = "󰏤" },
        { "<F9>", icon = { icon = "", color = "red" } },
        { "<F10>", icon = "󰆷" },
        { "<F11>", icon = "󰆹" },
        { "<S-F11>", icon = "󰆸" },
        {
          hidden = true,
          { "<F17>" },
          { "<F23>" },
          { "<F41>" },
        },
      },
    },
  },
}
