local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      -- lazy = true,
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  keys = {
    { "<leader>ff", "<CMD>Telescope find_files<CR>",                                           desc = "Find files" },
    { "<leader>fp", "<CMD>Telescope find_files cwd=~/.dotfiles/.config/nvim/lua/plugins/<CR>", desc = "Plugins config files" },
    { "<leader>fg", "<CMD>Telescope live_grep<CR>",                                            desc = "Find Text" },
    { "<leader>fe", "<CMD>Telescope file_browser<CR>",                                         desc = "File Browser" },
    { "<leader>fb", "<CMD>Telescope buffers<CR>",                                              desc = "List open buffer" },
    { "<leader>fd", "<CMD>Telescope diagnostics<CR>",                                          desc = "List Dianostics" },
    { "<leader>ft", "<CMD>Telescope treesitter<CR>",                                           desc = "List Function names, variables, from Treesitter" },
    { "<leader>fk", "<CMD>Telescope keymaps<CR>",                                              desc = "List keymaps" },
    { "<leader>fn", "<CMD>Telescope noice<CR>",                                                desc = "Help tags" },
    { "<leader>fh", "<CMD>Telescope help_tags<CR>",                                            desc = "Help tags" },
    -- {
    --   "<leader>fo",
    --   function()
    --     local obsidian_vault_path = "~/Documents/Obsidian Vault/"
    --     require('telescope.builtin').find_files({
    --       prompt_title = "Obsidian Vault",
    --       cwd = obsidian_vault_path,
    --       initial_mode = "normal",
    --     })
    --   end,
    --   desc = "Obsidian Vault"
    -- },
    -- {
    --   "<leader>oe",
    --   function()
    --     local obsidian_vault_path = "~/Documents/Obsidian Vault/"
    --     local telescope = require("telescope")
    --     telescope.extensions.file_browser.file_browser({
    --       prompt_title = "Obsidian Vault",
    --       path = obsidian_vault_path,
    --       cwd = obsidian_vault_path,
    --       respect_gitignore = false,
    --       hidden = false,
    --       grouped = true,
    --       initial_mode = "normal",
    --     })
    --   end,
    --   desc = "File browser Obsidian"
    -- },
  },
}



function M.config()
  local icons = {
    ChevronRight = "",
    -- ChevronRight = "",
    Forward = "  ",
  }

  local actions = require("telescope.actions")
  local fb_actions = require("telescope").extensions.file_browser.actions

  require("telescope").setup({
    defaults = {
      prompt_prefix = icons.ChevronRight .. " ",
      selection_caret = icons.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      dynamic_preview_title = true,
      layout_config = {
        horizontal = {
          preview_cutoff = 100,
          preview_width = 0.5,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        -- layout_strategy = "vertical",
        layout_config = {
          width = 0.8,
          -- width = { 0.8, max = 70 },
          -- height = 0.8,
          height = { 0.8, max = 70 },
          -- preview_cutoff = 1,    -- ปิด preview โดยค่าเริ่มต้น
          -- horizontal = {
          --   preview_width = 0.5, -- ขนาดของ preview
          --     preview_height = 0.5,     -- ขนาดของ preview
          --     results_height = 0.5,     -- ขนาดของผลลัพธ์
          --     results_width = 0.5,      -- ขนาดของผลลัพธ์
          --     -- preview location
          --     preview_position = "top", -- แสดง preview ข้างบน
          -- },
        },
      },


      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        find_command = { "rg", "--files", "--glob", "!**/{.git,node_modules}/*", "-L" },
        layout_config = {
          width = 0.8,
          -- height = 0.7
          -- width = { 0.8, max = 70 },
          height = { 0.8, max = 70 }
        },
      },
      -- find_files = {
      --   find_command = { "rg", "--files", "--glob", "!**/{.git,node_modules}/*", "-L" },
      --   layout_strategy = "vertical",
      --   -- theme = "dropdown",
      --   -- wrap_results = true,
      --   -- hidden = true,
      --   -- no_ignore = false,
      --   -- previewer = false,
      --   layout_config = {
      --     vertical = {
      --       preview_height = 0.3,
      --       results_height = 0.7,
      --     },
      --     prompt_position = "top",
      --     -- width = { 0.8, max = 70 },
      --     -- height = { 0.7, max = 70 }
      --     -- height = function(_, _, max_lines)
      --     --   return max_lines * 0.5
      --     -- end,
      --   },
      -- },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        layout_config = {
          prompt_position = "top",
          width = { 0.7, max = 70 },
        },
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      },
      file_browser = {
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        -- previewer = false,
        initial_mode = "normal",
        layout_config = {
          prompt_position = "top",
          width = 0.8,
          height = 0.8,
          -- width = { 0.8, max = 70 },
          -- height = { 0.8, max = 70 },
        },
        wrap_results = true,
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          -- your custom insert mode mappings
          ["n"] = {
            -- your custom normal mode mappings
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["/"] = function()
              vim.cmd("startinsert")
            end,
            ["<C-u>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
            ["<PageUp>"] = actions.preview_scrolling_up,
            ["<PageDown>"] = actions.preview_scrolling_down,
          },
        },
      },
    },
  })
  -- require("telescope").load_extension("fzf")
  require("telescope").load_extension("file_browser")
end

return M
