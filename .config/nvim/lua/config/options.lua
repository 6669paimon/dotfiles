local opt = vim.opt

opt.mouse = ""
opt.encoding = "utf-8"
opt.shortmess:append "sI" -- Disable nvim intro
opt.clipboard = "unnamedplus"
opt.hidden = true
opt.wrap = false
opt.backup = false
opt.swapfile = false
opt.cmdheight = 0
opt.showcmd = false
opt.showmode = false
opt.laststatus = 3
opt.background = "dark"
opt.termguicolors = true
opt.colorcolumn = "80"
opt.cursorline = true
-- opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", lastline = " " } -- make EndOfBuffer invisible

-- Line nubmer
-- opt.signcolumn = "yes"
opt.nu = true
opt.relativenumber = true
opt.ruler = false

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Tab indent
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- opt.showtabline = 0

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Split
opt.splitbelow = true
opt.splitright = true

-- Popup menu
opt.pumheight = 15
opt.completeopt = { "menu", "menuone", "noselect" }

-- Cursor Blinking
-- vim.opt.guicursor = {
--   "n-v-c:block",                                 -- Normal, visual, command-line: block cursor
--   "i-ci-ve:ver25",                               -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
--   "r-cr:hor20",                                  -- Replace, command-line replace: horizontal bar cursor with 20% height
--   "o:hor50",                                     -- Operator-pending: horizontal bar cursor with 50% height
--   "a:blinkwait700-blinkoff400-blinkon250",       -- All modes: blinking settings
--   "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
-- }
