return {
  "folke/noice.nvim",
  -- commit = "d9328ef903168b6f52385a751eb384ae7e906c6f",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      keys = {
        {
          "<leader>no",
          function()
            require("notify").dismiss({ silent = true, pending = true })
          end,
          desc = "Dismiss All Notifications",
        },
      },
      config = function()
        require("notify").setup({
          background_colour = "#000000",
          stages = "static",
          timeout = 2500,
          max_height = function()
            return math.floor(vim.o.lines * 0.75)
          end,
          max_width = function()
            return math.floor(vim.o.columns * 0.50)
          end,
          on_open = function(win)
            vim.api.nvim_win_set_config(win, { zindex = 100 })
          end,
        })
      end,
    },
  },
  event = "VeryLazy",
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = {
        enabled = false,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      -- bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
    messages = {
      enabled = true,            -- enables the Noice messages UI
      view = "notify",           -- default view for messages
      view_error = "notify",     -- view for errors
      view_warn = "notify",      -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "mini",      -- view for search count messages. Set to `false` to disable
      -- view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    views = {
      mini = {
        win_options = {
          winblend = 15,
          winhighlight = {
            Normal = "NoiceMini",
            FloatBorder = "FloatBorder"
          }
        }
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
  }
}
