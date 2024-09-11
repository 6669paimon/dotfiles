local M = {
  'b0o/incline.nvim',
  -- event = 'VeryLazy',
  event = "BufReadPre",
  priority = 1200,
}


M.config = function()
  local devicons = require 'nvim-web-devicons'
  local helpers = require 'incline.helpers'
  require('incline').setup {
    debounce_threshold = {
      falling = 50,
      rising = 10
    },
    hide = {
      cursorline = false,
      focused_win = false,
      only_win = true
    },
    highlight = {
      groups = {
        InclineNormal = {
          default = true,
          group = "InclineNA"
        },
        InclineNormalNC = {
          default = true,
          group = "InclineNA"
        }
      }
    },
    ignore = {
      buftypes = "special",
      filetypes = {},
      floating_wins = true,
      unlisted_buffers = true,
      wintypes = "special"
    },
    -- render = "basic",
    -- render = function(props)
    --   local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    --   if filename == '' then
    --     filename = '[No Name]'
    --   end
    --   local modified = vim.bo[props.buf].modified
    --   return {
    --     ' ',
    --     filename,
    --     modified and { ' *', guifg = '#D94E4C', gui = 'bold' } or '',
    --     ' ',
    --     -- guibg = '#092033',
    --     -- guifg = '#aad2ee',
    --   }
    -- end,
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      if filename == '' then
        filename = '[No Name]'
      end
      local ft_icon, ft_color = devicons.get_icon_color(filename)
      local modified = vim.bo[props.buf].modified
      return {
        ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
        ' ',
        { filename, gui = modified and 'bold,italic' or 'bold' },
        modified and { ' *', guifg = '#D94E4C', gui = 'bold' } or '',
        ' ',
        --     guibg = '#092033',
        --     guifg = '#aad2ee',
      }
    end,
    window = {
      margin = {
        horizontal = 0,
        vertical = 0
      },
      options = {
        signcolumn = "no",
        wrap = false
      },
      overlap = {
        borders = true,
        statusline = false,
        tabline = false,
        winbar = false
      },
      padding = 0,
      padding_char = " ",
      placement = {
        horizontal = "right",
        vertical = "top"
      },
      width = "fit",
      winhighlight = {
        active = {
          EndOfBuffer = "None",
          Normal = "InclineNormal",
          Search = "None"
        },
        inactive = {
          EndOfBuffer = "None",
          Normal = "InclineNormalNC",
          Search = "None"
        }
      },
      zindex = 50
    }
  }
end

return M
