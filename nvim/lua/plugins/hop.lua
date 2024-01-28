local M = {
	"phaazon/hop.nvim",
}

function M.config()
	require("hop").setup({
		keys = "etovxqpdygfblzhckisuran;",
		teasing = false,
		-- term_seq_bias = 0.5,
		-- create_hl_autocmd = false,
	})
	-- normal mode (easymotion-like)
	vim.api.nvim_set_keymap("n", ",f", "<cmd>HopChar1AC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", ",F", "<cmd>HopChar1BC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", ",b", "<cmd>HopWordBC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", ",w", "<cmd>HopWordAC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", ",j", "<cmd>HopLineStartAC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", ",k", "<cmd>HopLineStartBC<CR>", { noremap = true })

	-- visual mode (easymotion-like)
	vim.api.nvim_set_keymap("v", ",f", "<cmd>HopChar1AC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("v", ",F", "<cmd>HopChar1BC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("v", ",w", "<cmd>HopWordAC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("v", ",b", "<cmd>HopWordBC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("v", ",j", "<cmd>HopLineAC<CR>", { noremap = true })
	vim.api.nvim_set_keymap("v", ",k", "<cmd>HopLineBC<CR>", { noremap = true })

	-- normal mode (sneak-like)
	vim.api.nvim_set_keymap("n", ",s", "<cmd>HopChar2AC<CR>", { noremap = false })
	vim.api.nvim_set_keymap("n", ",S", "<cmd>HopChar2BC<CR>", { noremap = false })

	-- visual mode (sneak-like)
	vim.api.nvim_set_keymap("v", ",s", "<cmd>HopChar2AC<CR>", { noremap = false })
	vim.api.nvim_set_keymap("v", ",S", "<cmd>HopChar2BC<CR>", { noremap = false })
end

return M
