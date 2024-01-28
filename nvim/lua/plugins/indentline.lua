return {
	"lukas-reineke/indent-blankline.nvim",
	name = "indent_blankline",
	even = { "BufReadPost", "BufNewfile" },
	config = function()
		local highlight = {
			"IdenGray",
		}
		local hlScope = {
			"IdenScope",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- vim.api.nvim_set_hl(0, "IdenGray", { fg = "#233d45" })
			vim.api.nvim_set_hl(0, "IdenGray", { fg = "#1f3e47" })
			-- vim.api.nvim_set_hl(0, "IdenGray", { fg = "#1f3a42" })
			-- vim.api.nvim_set_hl(0, "IdenScope", { fg = "#196a82" })
			vim.api.nvim_set_hl(0, "IdenScope", { fg = "#1e677d" })
			-- vim.api.nvim_set_hl(0, "IdenScope", { fg = "#448ca6" })
		end)
		require("ibl").setup({
			indent = {
				char = "│",
				highlight = highlight,
			},
			scope = {
				highlight = hlScope,
				enabled = true,
			},
		})
	end,
}
