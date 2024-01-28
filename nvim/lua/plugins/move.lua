local M = {
  'fedepujol/move.nvim',
}

function M.config()
  local opts = { noremap = true, silent = true }
  -- normal-mode commands
  -- vim.keymap.set('n', '<S-A-Down>', ':MoveLine(1)<CR>', opts)
  -- vim.keymap.set('n', '<S-A-Up>', ':MoveLine(-1)<CR>', opts)
  vim.keymap.set('n', '<C-j>', ':MoveLine(1)<cr>', opts)
  vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<cr>', opts)

  -- visual-mode commands
  -- vim.keymap.set('v', '<S-A-Down>', ':MoveBlock(1)<CR>', opts)
  -- vim.keymap.set('v', '<S-A-Up>', ':MoveBlock(-1)<CR>', opts)
  vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<cr>', opts)
  vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<cr>', opts)
end

return M
