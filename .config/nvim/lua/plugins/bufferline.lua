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
        show_buffer_close_icons = false,
        show_close_icon = false,

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character

          }
        },
      },

      highlights = {
        indicator_selected = {
          fg = '#f73e3e',
        },
      },
    }
  end
}
