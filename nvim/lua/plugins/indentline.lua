return {
	"lukas-reineke/indent-blankline.nvim",
	name = "indent_blankline",
	even = { "BufReadPost", "BufNewfile" },
	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
			},
		})
	end,
}
