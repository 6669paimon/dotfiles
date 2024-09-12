return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    -- { "J", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    -- { "K", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
  },
  config = function()
    require('bufferline').setup {
      options = {

        mode = "tabs",
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = { '|', '' },
        always_show_bufferline = false,
        -- enforce_regular_tabs = false | true,
        -- auto_toggle_bufferline = true | false,
        -- indicator = {
        --   icon = '▊',
        -- },

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Title",
            separator = true -- use a "true" to enable the default, or set your own character

          }
        },
      },

      highlights = {
        indicator_selected = {
          fg = '#f73e3e',
          -- fg = '#96d0ff',
        },
      },
    }
    -- vim.cmd("set showtabline=1")
  end
}
