-- NOTE: Debug Adapter Protocol
return {
  "mfussenegger/nvim-dap",
  --event = "VeryLazy",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },

  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "DAP | Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "DAP | Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end,                                             desc = "DAP | Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "DAP | Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end,                                                desc = "DAP | Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end,                                            desc = "DAP | Step Into" },
    { "<leader>dj", function() require("dap").down() end,                                                 desc = "DAP | Down" },
    { "<leader>dk", function() require("dap").up() end,                                                   desc = "DAP | Up" },
    { "<leader>dl", function() require("dap").run_last() end,                                             desc = "DAP | Run Last" },
    { "<leader>do", function() require("dap").step_out() end,                                             desc = "DAP | Step Out" },
    { "<leader>dO", function() require("dap").step_over() end,                                            desc = "DAP | Step Over" },
    { "<leader>dp", function() require("dap").pause() end,                                                desc = "DAP | Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "DAP | Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end,                                              desc = "DAP | Session" },
    { "<leader>dt", function() require("dap").terminate() end,                                            desc = "DAP | Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "DAP | Widgets" },
    { "<leader>du", function() require("dapui").toggle() end,                                             desc = "DAP | UI Toggle" },
  },


  config = function()
    -- NOTE: Check out this for guide
    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    local dap = require "dap"
    local dapui = require "dapui"
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    --
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end

    -- NOTE: Make sure to install the needed files/exectubles through mason
    require "plugins.dap.settings.codelldb"
    require "plugins.dap.settings.debugpy"
  end,
}
