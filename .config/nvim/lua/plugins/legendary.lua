return {
  "mrjones2014/legendary.nvim",
  dependencies = {
    "hinell/duplicate.nvim",
  },
  priority = 10000,
  lazy = false,
  config = function()
    local legendary = require("legendary")
    legendary.keymaps({
      -- duplicate
      {
        description = "Line: duplicate up",
        mode = { "n" },
        "<A-p>",
        -- "<C-p>",
        "<CMD>LineDuplicate -1<CR>",
      },
      {
        description = "Line: duplicate down",
        mode = { "n" },
        "<A-n>",
        -- "<C-n>",
        "<CMD>LineDuplicate +1<CR>",
      },
      {
        description = "Selection: duplicate up",
        mode = { "v" },
        "<A-p>",
        -- "<C-p>",
        "<CMD>VisualDuplicate -1<CR>",
      },
      {
        description = "Selection: duplicate down",
        mode = { "v" },
        "<A-n>",
        -- "<C-n>",
        "<CMD>VisualDuplicate +1<CR>",
      },
      -- project
      -- {
      --   description = "find a project based on patterns",
      --   mode = { "n" },
      --   "<leader>pd",
      --   "<CMD>Telescope neovim-project discover<CR>",
      -- },
      -- {
      --   description = "select a project from your recent history",
      --   mode = { "n" },
      --   "<leader>ph",
      --   "<CMD>Telescope neovim-project history<CR>",
      -- },
    })
  end,
}
