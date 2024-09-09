local function map(mode, lhs, rhs, opt, des)
  opt = vim.tbl_deep_extend("force", opt or {}, des or {})
  vim.keymap.set(mode, lhs, rhs, opt)
end

local opts = { noremap = true, silent = true }

-- Set Leader Key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<Esc>", "<CMD>noh<CR>", opts, { desc = "Clear search highlights" })
map("n", "<leader>q", "<CMD>confirm q<CR>", opts, { desc = "Close file" })
map("n", "<leader>x", "<CMD>qa<CR>", opts, { desc = "Close all file" })
map("n", "<leader>w", "<CMD>w<CR>", opts, { desc = "Save file" })
map("x", "p", '"_dP', { desc = "Visual paste, don't yank" })
map("n", "db", 'vbd', { desc = "Delete a word backward" })

-- Move,Add,Delete line Up/Down current cursor
map("v", "J", ":m '>+1<CR>gv=gv", opts, { desc = "Visual move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", opts, { desc = "Visual move line up" })
map("n", "<C-j>", "m`o<Esc>``", { desc = "Add line below" })
map("n", "<C-k>", "m`O<Esc>``", { desc = "Add line above" })
map("n", "J", "mzJ`z", { desc = "Delete line below" })
map("n", "K", "kdd", { desc = "Delete line above" })

-- Center View
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "gg", "ggzz")
map("n", "G", "Gzz")
map("n", "{", "{zz")
map("n", "}", "}zz")

-- Move cursor to begining or end of line
map("i", "<C-a>", "<Esc>I", { desc = "move begining of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("", "H", "^", { desc = "move begining of line" })
map("", "L", "g_", { desc = "move end of line" })

-- Move window
map("n", "<M-h>", "<C-w>h", opts)
map("n", "<M-k>", "<C-w>k", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-l>", "<C-w>l", opts)
map("t", "<M-h>", "<CMD>wincmd h<CR>")
map("t", "<M-k>", "<CMD>wincmd k<CR>")
map("t", "<M-j>", "<CMD>wincmd j<CR>")
map("t", "<M-l>", "<CMD>wincmd l<CR>")

-- Resize window
map("n", "<C-up>", "<C-w>+", opts)
map("n", "<C-down>", "<C-w>-", opts)
map("n", "<C-left>", "<C-w><", opts)
map("n", "<C-right>", "<C-w>>", opts)

-- Disable arrow
map("", "<Up>", "<nop>", opts)
map("", "<Down>", "<nop>", opts)
map("", "<Left>", "<nop>", opts)
map("", "<Right>", "<nop>", opts)

-- Move next/previous buffer
map("n", "[b", "<CMD>bprevious<CR>", opts, { desc = "move previous buffer" })
map("n", "]b", "<CMD>bnext<CR>", opts, { desc = "move next buffer" })

-- Comment
-- map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
-- map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Split window
map("n", "<leader>\\", "<CMD>split<CR>")
map("n", "<leader>|", "<CMD>vsplit<CR>")

-- Insert mode backward delete
map("i", "<C-d>", "<Del>")
map("i", "<A-d>", "<Space><Esc>ce")

-- Find/replace for the word under the cursor
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- New tab
map("n", "<leader>te", "<CMD>tabedit<CR>")

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", opts)


-- Quick compile and run
-- python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>cc', '',
      {
        noremap = true,
        silent = true,
        callback = function()
          local venv_python = vim.fn.getcwd() .. "/venv/bin/python"
          local python_cmd = vim.fn.filereadable(venv_python) == 1 and venv_python or "test"
          local file_path = vim.fn.expand("%:p")
          vim.cmd("12split | terminal " .. python_cmd .. " " .. file_path)
        end
      })
  end
})
-- c++
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
