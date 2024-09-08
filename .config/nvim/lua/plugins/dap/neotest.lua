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
  { "<leader>tr", function() require("neotest").run.run() end,                                        desc = "TEST | Run Nearest" },
  { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "TEST | Run File" },
  { "<leader>ta", function() require("neotest").run.run(vim.uv.cwd()) end,                            desc = "TEST | Run All Test Files" },
  { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "TEST | Run Last" },
  { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "TEST | Toggle Summary" },
  { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "TEST | Show Output" },
  { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "TEST | Toggle Output Panel" },
  { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "TEST | Stop" },
  { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,                 desc = "TEST | Toggle Watch" },
}

function M.config()
  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false }
        -- runner = "pytest"
        -- python = ".venv/bin/python"
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
