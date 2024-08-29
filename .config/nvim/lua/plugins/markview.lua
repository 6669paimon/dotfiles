return {
  "OXY2DEV/markview.nvim",
  lazy = false,    -- Recommended
  ft = "markdown", -- If you decide to lazy-load anyway
  keys = {
    { "<leader>v", "<cmd>Markview<cr>", desc = "Markview toggle" },
  },
  config = function()
    local markview = require("markview")
    local presets = require("markview.presets")
    markview.setup({

      headings = presets.headings.glow_labels,

      list_items = {
        enable = false,
      },
      checkboxes = {
        enable = false,
      },


      modes = { "n", "i", "no", "c" }, -- Change these modes
      hybrid_modes = { "n", "i" },     -- Uses this feature on
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].conecalcursor = "c"
        end
      },
    })
    vim.cmd('hi MarkviewCode guibg=#071521')
  end
}
