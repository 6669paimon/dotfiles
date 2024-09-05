local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
}


function M.config()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  local api = require("nvim-tree.api")
  vim.keymap.set("n", "<leader>e", api.tree.toggle)

  local function my_on_attach(bufnr)
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<leader>e", api.tree.toggle, opts("Toggle"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  end

  require("nvim-tree").setup({
    hijack_netrw = false,
    sync_root_with_cwd = true,
    view = {
      width = 25,
      preserve_window_proportions = true,
    },
    on_attach = my_on_attach,
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
            -- default = "󰉋 ",
            -- open = " ",
            -- empty = " ",
            -- empty_open = " ",
            -- symlink = " ",
            -- symlink_open = " ",

            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = " ",
            symlink_open = "",
          },
          git = {
            -- unstaged = "",
            unstaged = " ",
            staged = "S",
            unmerged = "",
            renamed = " ",
            untracked = "U",
            deleted = " ",
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
