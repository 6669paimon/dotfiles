local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Leader Key
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Delete is not cut
-- Delete, d
-- keymap.set({ "n", "x" }, "d", '"_d')
-- keymap.set({ "n", "x" }, "D", '"_D')
-- keymap.set({ "n", "x" }, "x", '"_x')
-- keymap.set({ "n", "x" }, "X", '"_X')
-- Cut, x
-- keymap.set({ "n", "x" }, "x", "d")
-- keymap.set({ "n", "x" }, "xx", "dd")
-- keymap.set({ "n", "x" }, "X", "D")

-- Visual paste, don't yank
keymap.set("x", "p", '"_dP')

-- Delete a word backwards
-- keymap.set("n", "db", 'vb"_d')
keymap.set("n", "db", 'vbd')

-- Select all
-- keymap.set("n", "<c-a>", "ggVG")

keymap.set("n", "<leader>w", "<CMD>w<CR>", opts)
keymap.set("n", "<leader>x", "<CMD>x<CR>", opts)
keymap.set("n", "<leader>q", "<CMD>confirm q<CR>", opts)
-- keymap.set("n", "<leader>h", "<CMD>noh<CR>", opts)

-- keymap.set("n", "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
-- keymap.set("n", "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Move select
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Add line
keymap.set("n", "<C-k>", "m`O<Esc>``")
keymap.set("n", "<C-j>", "m`o<Esc>``")
-- keymap.set("n", "<S-A-k>", "m`O<Esc>``")
-- keymap.set("n", "<S-A-j>", "m`o<Esc>``")
-- Delete line Up/Down current cursor
keymap.set("n", "K", "kdd")
keymap.set("n", "J", "mzJ`z")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "G", "Gzz")
keymap.set("n", "gg", "ggzz")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")

-- find/replace for the word under the cursor
keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Terminal
keymap.set("t", "<esc>", "<C-\\><C-n>", opts)
-- keymap.set("n", "<C-t>", "<CMD>tabnew | term<CR>", opts)

-- Buffer
keymap.set("n", "[b", "<CMD>bprevious<CR>", opts)
keymap.set("n", "]b", "<CMD>bnext<CR>", opts)

-- Move Firts&End line
keymap.set("", "H", "^")
keymap.set("", "L", "g_")
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

-- Disable arrow
keymap.set("", "<Up>", "<nop>", opts)
keymap.set("", "<Down>", "<nop>", opts)
keymap.set("", "<Left>", "<nop>", opts)
keymap.set("", "<Right>", "<nop>", opts)
