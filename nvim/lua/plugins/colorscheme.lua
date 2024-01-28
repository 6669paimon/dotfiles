local M = {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	require("solarized-osaka").setup({
		transparent = true,
		terminal_colors = true,
		styles = {
			-- Background style can be "dark", "transparent", "normal"
			sidebars = "transparent",
			floats = "normal",
		},
		on_highlights = function(hl, c)
			-- Custom highlights
			-- hl.CursorLine = {
			-- 	bg = "#073642",
			-- }
			hl.LineNr = {
				fg = "#3f6775",
			}
			hl.NvimTreeNormal = {
				bg = "#00212B",
			}
			-- completion menu
			-- hl.Pmenu = {
			-- 	bg = "#00212B",
			-- }
			-- hl.PmenuSel = {
			-- 	fg = "#c5dbdb",
			-- 	bg = "#003847",
			-- }

			-- Telescope highlights
			hl.TelescopeNormal = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopeBorder = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePromptNormal = {
				bg = c.bg_dark,
			}
			hl.TelescopePromptBorder = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePromptTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePreviewTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopeResultsTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
		end,
	})
	vim.cmd("colorscheme solarized-osaka")
end

return M
