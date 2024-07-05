-- highlight yanked text for 200ms using the "Visual" highlight group
-- vim.cmd [[
--   augroup highlight_yank
--   autocmd!
--   au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
--   augroup END
-- ]]
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


-- relative number toggle insert
-- vim.cmd([[
--   augroup numbertoggle
--     autocmd!
--     autocmd BufEnter,FocusGained,InsertLeave * set rnu
--     autocmd BufLeave,FocusLost,InsertEnter * set nornu
--   augroup END
-- ]])

-- not auto comment
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Disable line number Terminal
vim.api.nvim_command("autocmd TermOpen * startinsert")
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")
-- vim.api.nvim_command("autocmd TermOpen * setlocal signcolumn=no")

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
--
-- autocmd("FocusGained", {
--   callback = function()
--     vim.cmd "checktime"
--   end,
--   group = general,
--   desc = "Update file when there are changes",
-- })
--
-- autocmd("VimResized", {
--   callback = function()
--     vim.cmd "wincmd ="
--   end,
--   group = general,
--   desc = "Equalize Splits",
-- })
-- autocmd("ModeChanged", {
-- 	callback = function()
-- 		if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
-- 			vim.opt.hlsearch = true
-- 		else
-- 			vim.opt.hlsearch = false
-- 		end
-- 	end,
-- 	group = general,
-- 	desc = "Highlighting matched words when searching",
-- })
