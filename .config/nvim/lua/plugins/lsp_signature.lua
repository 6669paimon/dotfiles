local border = {
  { "╭", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╮", "CmpBorder" },
  { "│", "CmpBorder" },
  { "╯", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╰", "CmpBorder" },
  { "│", "CmpBorder" },
}

return {
  'ray-x/lsp_signature.nvim',
  config = function()
    require 'lsp_signature'.setup({
      bind = true,
      -- use_lspsaga = true,
      -- doc_lines = 10,
      hint_enable = false,
      handler_opts = {
        border = border,
      },
      max_height = 15,
      max_width = 60,
    })
  end,
}
