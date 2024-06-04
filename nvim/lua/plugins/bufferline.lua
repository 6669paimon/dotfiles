return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		-- { "J", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		-- { "K", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
	},
	opts = {
		options = {
			mode = "tabs",
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
	},
}
