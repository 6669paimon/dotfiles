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

-- Relative number toggle insert
-- vim.cmd([[
--   augroup numbertoggle
--     autocmd!
--     autocmd BufEnter,FocusGained,InsertLeave * set rnu
--     autocmd BufLeave,FocusLost,InsertEnter * set nornu
--   augroup END
-- ]])

-- local fn = vim.fn
-- local autocmd = vim.api.nvim_create_autocmd
-- local augroup = vim.api.nvim_create_augroup
--
-- autocmd("BufEnter", {
--   callback = function()
--     vim.opt.formatoptions:remove {"c","r","o"}
--   end,
--   group = general,
--   desc = "Disable New Line Comment",
-- })

-- autocmd("FileType", {
--   pattern = { "c", "cpp", "py", "java", "cs" },
--   callback = function()
--     vim.bo.shiftwidth = 4
--   end,
--   group = general,
--   desc = "Set shiftwidth to 4 in these filetypes",
-- })
--
-- autocmd({ "FocusLost", "BufLeave", "BufWinLeave", "InsertLeave" }, {
--   callback = function()
--     if vim.bo.filetype ~= "" and vim.bo.buftype == "" then
--       vim.cmd "silent! w"
--     end
--   end,
--   group = general,
--   desc = "Auto Save",
-- })
