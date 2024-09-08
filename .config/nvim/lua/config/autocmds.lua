-- highlight yanked text for 200ms using the "Visual" highlight group
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- not auto comment
vim.cmd([[autocmd FileType * setlocal formatoptions-=cro]])

-- Disable line number Terminal
vim.api.nvim_command("autocmd TermOpen * startinsert")
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")
-- vim.api.nvim_command("autocmd TermOpen * setlocal signcolumn=no")


-- Quick compile and run
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_set_keymap('n', '<leader>cc',
      '<cmd>12split<bar>terminal python %<cr>',
      { noremap = true, silent = true })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_set_keymap('n', '<F9>', '<cmd>!g++ -std=c++17 % -o %:r<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F10>', '<cmd>12split<bar>terminal ./%:r<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cc',
      '<cmd>w<cr><cmd>!g++ -std=c++17 % -o %:r<cr><cmd>12split<bar>terminal ./%:r<cr>',
      { noremap = true, silent = true })
  end
})
