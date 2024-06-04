return {
	"mrjones2014/legendary.nvim",
	dependencies = {
		"hinell/duplicate.nvim",
	},
	priority = 10000,
	lazy = false,
	config = function()
		local legendary = require("legendary")
		legendary.keymaps({
			-- duplicate
			{
				description = "Line: duplicate up",
				mode = { "n" },
				"<S-A-p>",
				"<CMD>LineDuplicate -1<CR>",
			},
			{
				description = "Line: duplicate down",
				mode = { "n" },
				"<S-A-n>",
				"<CMD>LineDuplicate +1<CR>",
			},
			{
				description = "Selection: duplicate up",
				mode = { "v" },
				"<S-A-p>",
				"<CMD>VisualDuplicate -1<CR>",
			},
			{
				description = "Selection: duplicate down",
				mode = { "v" },
				"<S-A-n>",
				"<CMD>VisualDuplicate +1<CR>",
			},
			-- project
			{
				description = "find a project based on patterns",
				mode = { "n" },
				"<leader>pd",
				"<CMD>Telescope neovim-project discover<CR>",
			},
			{
				description = "select a project from your recent history",
				mode = { "n" },
				"<leader>ph",
				"<CMD>Telescope neovim-project history<CR>",
			},
		})
	end,
}
