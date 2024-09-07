local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "rcasia/neotest-bash",
    "alfaix/neotest-gtest",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
  }
}

M.keys = {
  { "<leader>tr", function() require("neotest").run.run() end,                                        desc = "Run Nearest" },
  { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File" },
  { "<leader>ta", function() require("neotest").run.run(vim.uv.cwd()) end,                            desc = "Run All Test Files" },
  { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Run Last" },
  { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary" },
  { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
  { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel" },
  { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop" },
  { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,                 desc = "Toggle Watch" },
}

function M.config()
  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false }
        -- runner = "pytest"
      },
      require "neotest-vitest",
      require "neotest-gtest",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" }
      },
    }
  }
end

return M
