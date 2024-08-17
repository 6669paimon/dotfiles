return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest eommit
  lazy = true,
  ft = "markdown",
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "Vault",
          path = "/home/Arawan/Documents/Obsidian Vault/",
        },
      },
      -- follow_url_func = function(url)
      --   vim.fn.jobstart({ "open", url })
      -- end,
      -- attachments = {
      --   img_folder = "assets",
      --   img_text_func = function(client, path)
      --     path = client:vault_relative_path(path) or path
      --     return string.format("![%s](%s)", path.name, path)
      --   end,
      -- },

      -- disable_frontmatter = true,

      -- Optional, alternatively you can customize the frontmatter data.
      ---@return table
      note_frontmatter_func = function(note)
        -- local date = os.date("%d/%m/%Y, %H:%M:%S")
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
        enable = true,
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
    })
  end,
}
