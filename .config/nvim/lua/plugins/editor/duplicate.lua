return {
  "hinell/duplicate.nvim",
  init = function()
    vim.keymap.set("n", "<A-p>", "<CMD>LineDuplicate -1<CR>", { desc = "Line: duplicate up" })
    vim.keymap.set("n", "<A-n>", "<CMD>LineDuplicate +1<CR>", { desc = "Line: duplicate down" })
    vim.keymap.set("v", "<A-p>", "<CMD>VisualDuplicate -1<CR>", { desc = "Selection: duplicate up" })
    vim.keymap.set("v", "<A-n>", "<CMD>VisualDuplicate +1<CR>", { desc = "Selection: duplicate up" })
  end
}
