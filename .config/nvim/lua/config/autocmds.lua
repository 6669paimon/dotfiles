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

-- vim.api.nvim_create_user_command("CloseBufferOrQuit", function()
--   local listed = vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val)'))
--   if listed == 1 then
--     vim.cmd('confirm quit')
--   else
--     vim.cmd('confirm bdelete')
--   end
-- end, {})
