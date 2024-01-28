return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "K", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "J", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
	},
	opts = {
		options = {
			mode = "tabs",
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
	},
}
