local M = {
	"nvim-lualine/lualine.nvim",
}

function M.config()
	local c = require("solarized-osaka.colors").setup({ tranform = true })
	-- local my_sol = require("lualine.themes.solarized-osaka")
	local my_status = {}
	local c_hov = "#003847"
	my_status.normal = {
		a = { bg = c_hov, fg = c.cyan },
		b = { bg = c.bg_statusline, fg = c.fg },
		c = { bg = c.bg_statusline, fg = c.fg },
		-- z = { bg = c.bg_statusline, fg = c.fg },
	}

	local conditions = {
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
	}

	require("lualine").setup({
		options = {
			theme = my_status,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
		},
		sections = {
			lualine_a = {
				function()
					return " "
				end,
			},
			lualine_b = { "mode" },
			lualine_c = {
				{
					"branch",
					color = { fg = c.cyan, bg = c_hov },
					cond = conditions.hide_in_width,
				},
				{
					"diagnostics",
					sections = { "error", "warn", "info", "hint" },
					-- always_visible = true,
				},
				function()
					return "%="
				end,
				{
					function()
						local msg = "No Active"
						local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
						local clients = vim.lsp.get_active_clients()
						if next(clients) == nil then
							return msg
						end
						for _, client in ipairs(clients) do
							local filetypes = client.config.filetypes
							if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
								return client.name
							end
						end
						return msg
					end,
					icon = " LSP:",
					cond = conditions.hide_in_width,
					color = { bg = c_hov, fg = c.cyan },
				},
			},
			lualine_x = {},
			lualine_y = {
				{
					"encoding",
					fmt = string.upper,
				},
				"filetype",
			},
			lualine_z = { "progress" },
		},
		-- extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
