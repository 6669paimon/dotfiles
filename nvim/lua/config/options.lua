local opt = vim.opt

-- vim.wo.number = true
opt.nu = true
opt.relativenumber = true

opt.encoding = "utf-8"

opt.scrolloff = 8
opt.sidescrolloff = 8

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.mouse = ""
opt.clipboard = "unnamed,unnamedplus"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
-- opt.autoread = true
-- vim.bo.autoread = true

opt.splitbelow = true
opt.splitright = true

-- opt.background = "dark"
-- opt.cursorline = true
opt.termguicolors = true

opt.hidden = true
opt.showmode = false
opt.cmdheight = 0
opt.showcmd = false
opt.ruler = false
opt.winblend = 0
opt.completeopt = { "menu", "menuone", "noselect" }
-- opt.wildoptions = 'pum'
-- opt.pumblend = 5
-- opt.pumheight = 10
--opt.signcolumn="yes"
-- opt.list = true
-- opt.listchars:append("eol:↴")

-- Place a column line
vim.opt.colorcolumn = "80"

-- vim.opt.guicursor = {
-- 	"n-v-c:block", -- Normal, visual, command-line: block cursor
-- 	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
-- 	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
-- 	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
-- 	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
-- 	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
-- }
