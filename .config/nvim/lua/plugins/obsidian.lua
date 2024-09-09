return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>",         desc = "New note" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>",     desc = "Daily note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>",      desc = "Search match in notes" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>",        desc = "Show tags note" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",   desc = "Show backlinks" },
    { "<leader>oi", "<cmd>ObsidianTemplate<cr>",    desc = "Insert template" },

  },
  opts = {
    workspaces = {
      {
        name = "Obsidian Vault",
        path = "/home/Arawan/Documents/Obsidian Vault/",
      },
    },

    notes_subdir = "notes",
    daily_notes = {
      folder = "daily",
      date_format = "%d-%m-%Y",
      -- template = "path/to/you/daily_note_template.md"
    },

    new_notes_location = "notes_subdir",
    wiki_link_func = function(opts)
      return string.format("[[%s]]", opts.path)
    end,

    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      local date = os.date("%Y/%m/%d, %H:%M:%S")
      local out = {
        id = note.id,
        tags = note.tags,
        created = date,
        modified = date
      }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      out.modified = date
      return out
    end,

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    ui = {
      enable = false,
      checkboxes = {
        [" "] = { char = "", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
    mappings = {
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
  end
}
