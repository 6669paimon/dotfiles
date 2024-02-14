local M = {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPost", "BufNewFile" },
}

function M.config()
	require("colorizer").setup({
		filetypes = {
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
			"css",
			"html",
			"astro",
			"lua",
		},
		user_default_options = {
			names = true,
			rgb_fn = true,
			hsl_fn = true,
			tailwind = "both",
			-- Available modes for `mode`: foreground, background,  virtualtext
			-- virtualtext = "■",
			-- mode = "virtualtext", -- Set the display mode.
		},
		buftypes = {},
	})
end

return M
