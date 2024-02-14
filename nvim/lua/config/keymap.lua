local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader Key
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set("n", "<leader>w", "<CMD>w<CR>", opts)
keymap.set("n", "<leader>q", "<CMD>confirm q<CR>", opts)
-- keymap.set("n", "<leader>h", "<CMD>nohl<CR>", opts)

keymap.set("n", "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Terminal
keymap.set("n", "<C-t>", "<CMD>tabnew | term<CR>", opts)
keymap.set("t", "<esc>", "<C-\\><C-n>", opts)

-- Buffer
keymap.set("n", "[b", "<CMD>bprevious<CR>", opts)
keymap.set("n", "]b", "<CMD>bprevious<CR>", opts)

-- Move Firts&End line
keymap.set("", "H", "^")
keymap.set("", "L", "$")
keymap.set("i", "<C-a>", "<Esc>I")
keymap.set("i", "<C-e>", "<End>")

-- Insert Backward Delete
keymap.set("i", "<C-d>", "<Del>")
keymap.set("i", "<A-d>", "<Space><Esc>ce")

-- New tab
keymap.set("n", "<leader>te", "<CMD>tabedit<CR>")

-- Split window
keymap.set("n", "<leader>\\", "<CMD>split<Return>")
keymap.set("n", "<leader>|", "<CMD>vsplit<Return>")

-- Move window
-- split pane
keymap.set("n", "<M-h>", "<C-w>h", opts)
keymap.set("n", "<M-k>", "<C-w>k", opts)
keymap.set("n", "<M-j>", "<C-w>j", opts)
keymap.set("n", "<M-l>", "<C-w>l", opts)
-- -- term pane
keymap.set("t", "<M-h>", "<CMD>wincmd h<CR>")
keymap.set("t", "<M-k>", "<CMD>wincmd k<CR>")
keymap.set("t", "<M-j>", "<CMD>wincmd j<CR>")
keymap.set("t", "<M-l>", "<CMD>wincmd l<CR>")
-- -- tmux
keymap.set("n", "<M-h>", "<CMD>TmuxNavigateLeft<CR>")
keymap.set("n", "<M-k>", "<CMD>TmuxNavigateUp<CR>")
keymap.set("n", "<M-j>", "<CMD>TmuxNavigateDown<CR>")
keymap.set("n", "<M-l>", "<CMD>TmuxNavigateRight<CR>")

-- Resize window
keymap.set("n", "<C-left>", "<C-w><", opts)
keymap.set("n", "<C-right>", "<C-w>>", opts)
keymap.set("n", "<C-up>", "<C-w>+", opts)
keymap.set("n", "<C-down>", "<C-w>-", opts)

-- New line above
keymap.set("n", "<C-p>", "m`O<Esc>``")
keymap.set("n", "<C-n>", "m`o<Esc>``")
