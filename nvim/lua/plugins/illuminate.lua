local M = {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
}

function M.config()
	require("illuminate").configure({
		filetypes_denylist = {
			"mason",
			"harpoon",
			"neo-tree",
			"DressingInput",
			"NeogitCommitMessage",
			"qf",
			"dirvish",
			"fugitive",
			"alpha",
			"NvimTree",
			"lazy",
			"Trouble",
			"netrw",
			"lir",
			"DiffviewFiles",
			"Outline",
			"Jaq",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"TelescopePrompt",
		},
	})
end

return M
