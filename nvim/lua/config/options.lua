local opt = vim.opt

vim.wo.number = true
-- opt.number=true
opt.relativenumber = true

opt.encoding = "utf-8"

opt.scrolloff = 5
opt.sidescrolloff = 5

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.mouse:append("a")
-- opt.clipboard:append("unnamedplus")
opt.clipboard:append({ "unnamed", "unnamedplus" })

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.wrap = false

opt.splitbelow = true
opt.splitright = true

-- opt.background = "dark"
opt.cursorline = true
opt.termguicolors = true

opt.hidden = true
opt.showmode = false
opt.cmdheight = 0
opt.showcmd = false
opt.ruler = false
-- opt.list = true
-- opt.listchars:append("eol:↴")
opt.winblend = 0
-- opt.wildoptions = 'pum'
-- opt.pumblend = 5
--opt.signcolumn="yes"
opt.completeopt = { "menu", "menuone", "noselect" }
-- opt.pumheight = 10
