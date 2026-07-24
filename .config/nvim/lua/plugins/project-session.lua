return {

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        manual_mode = false,
        detection_methods = { "pattern" },
        patterns = {
          ".git",
          "Makefile",
          "CMakeLists.txt",
          "package.json",
          "pyproject.toml",
          "go.mod",
          "Cargo.toml",
        },
        exclude_dirs = {
          "~/.cargo/*",
          "~/.local/*",
        },
      })

      require("telescope").load_extension("projects")

      -- keymap: find project
      vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects layout_config={width={0.5,max=50}} theme=dropdown initial_mode=normal<CR>", {
        desc = "Find Projects",
      })
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup({
        auto_restore = false,
        auto_save = true,
        suppressed_dirs = {
          "~/",
          "~/Downloads",
          "/",
        },
      })

      -- keymaps: session
      vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", {
        desc = "Session Save",
      })
      vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", {
        desc = "Session Restore",
      })
      vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", {
        desc = "Session Delete",
      })
    end,
  },

}
