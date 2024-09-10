return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    require('github-theme').setup({
      options = {
        transparent = true,      -- Disable setting background
        terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      },
      -- palettes = {},
      -- specs = {},
      groups = {
        all = {
          NormalFloat        = { fg = "#a5c2cc", bg = "#00101d" }, -- Normal text in floating windows.
          FloatBorder        = { fg = "#0965ba" },
          CmpBorder          = { fg = "#0965ba" },
          Pmenu              = { fg = "#a5c2cc", bg = "#0C1E2C" }, -- Popup menu: normal item.
          PmenuSel           = { bg = "#133c63" },                 -- Popup menu: selected item.
          PmenuThumb         = { bg = "#133c63" },                 -- Popup menu: Thumb of the scrollbar.
          VertSplit          = { fg = "#133c63" },                 -- the column separating vertically split windows
          WinSeparator       = { fg = "#133c63" },                 -- (nvim >= 0.10) the column separating vertically split windows
          Search             = { bg = '#124066', fg = '#e2e2e2' },
          TabLineSel         = { fg = "#afb7ba", bg = "#f73e3e" }, -- tab pages line, active tab page label
          Visual             = { bg = "#124066", fg = '#e2e2e2' },
          ColorColumn        = { bg = "#041520" },                 -- used for the columns set with 'colorcolumn'
          CursorLine         = { bg = "#041520" },
          CursorLineNr       = { fg = "#b0ced9", bg = "#00101d" }, -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.

          TelescopeSelection = { bg = "#124066", fg = '#e2e2e2' },
          TelescopeMatching  = { fg = "#fd5e3a" },
          TelescopeBorder    = { fg = "#0965ba" },

          InclineNormal      = { fg = "#aad2ee", bg = "#092033" },
          InclineNA          = { fg = "#68838c", bg = "#00101d" }, -- Normal text in floating windows.

          NoiceMini          = { fg = "#73BCD9", bg = "#092033" },

          RenderMarkdownCode = { bg = "#071521" },

          NotifyINFOBorder   = { fg = "#73BCD9" },
          NotifyINFOIcon     = { fg = "#73BCD9" },
          NotifyINFOTitle    = { fg = "#73BCD9" },

          DiagnosticSignInfo = { fg = "#61affa" },

          NvimTreeFolderIcon = { fg = "#539bf5" },
          NvimTreeCursorLine = { bg = "#124066" },

          LuaLineDiffAdd     = { fg = "#768390", bg = "NONE" },
          LuaLineDiffChange  = { fg = "#768390", bg = "NONE" },
          LuaLineDiffDelete  = { fg = "#768390", bg = "NONE" },
        }
      },
    })

    -- setup must be called before loading
    vim.cmd('colorscheme github_dark_dimmed')
  end,
}
