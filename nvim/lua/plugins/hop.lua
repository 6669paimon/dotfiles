local M = {
  "phaazon/hop.nvim",
}

function M.config()
  require("hop").setup({
    keys = "etovxqpdygfblzhckisuran;",
    teasing = false,
    -- term_seq_bias = 0.5,
    -- create_hl_autocmd = false,
  })
  require("hop").setup()

  -- (easymotion-like)
  vim.api.nvim_set_keymap("", "f", "<cmd>HopChar1CurrentLineAC<CR>", { noremap = true })
  vim.api.nvim_set_keymap("", "F", "<cmd>HopChar1CurrentLineBC<CR>", { noremap = true })
  vim.api.nvim_set_keymap("", ",f", "<cmd>HopChar1AC<CR>", { noremap = true })
  vim.api.nvim_set_keymap("", ",F", "<cmd>HopChar1BC<CR>", { noremap = true })
  vim.api.nvim_set_keymap("", ",b", "<cmd>HopWordBC<CR>", { noremap = true })
  vim.api.nvim_set_keymap("", ",w", "<cmd>HopWordAC<CR>", { noremap = true })
  vim.api.nvim_set_keymap("", ",j", "<cmd>HopLineStartAC<CR>", { noremap = true })
  vim.api.nvim_set_keymap("", ",k", "<cmd>HopLineStartBC<CR>", { noremap = true })

  -- (sneak-like)
  vim.api.nvim_set_keymap("", ",s", "<cmd>HopChar2AC<CR>", { noremap = false })
  vim.api.nvim_set_keymap("", ",S", "<cmd>HopChar2BC<CR>", { noremap = false })
end

return M
