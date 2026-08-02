local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
  },
}

function M.config()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle nvim-tree' })

  require("nvim-tree").setup({
    hijack_netrw = false,
    sync_root_with_cwd = true,
    view = {
      width = 24,
      preserve_window_proportions = true,
    },
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 2,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        glyphs = {
          default = " ",
          symlink = "",
          bookmark = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = " ",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {},
    },

    diagnostics = {
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
  })
end

return M
