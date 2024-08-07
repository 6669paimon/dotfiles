return {
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  config = function()
    -- Default options
    require('github-theme').setup({
      options = {
        -- Compiled file's destination location
        -- compile_path = vim.fn.stdpath('cache') .. '/github-theme',
        -- compile_file_suffix = '_compiled', -- Compiled file suffix
        -- hide_end_of_buffer = true,         -- Hide the '~' character at the end of the buffer for a cleaner look
        -- hide_nc_statusline = true,         -- Override the underline style for non-active statuslines
        transparent = true,      -- Disable setting background
        terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        -- dim_inactive = false,              -- Non focused panes set to alternative background
        -- module_default = true,             -- Default enable value for modules
        -- styles = {                         -- Style to be applied to different syntax groups
        --   comments = 'NONE',               -- Value is any valid attr-list value `:help attr-list`
        --   functions = 'NONE',
        --   keywords = 'NONE',
        --   variables = 'NONE',
        --   conditionals = 'NONE',
        --   constants = 'NONE',
        --   numbers = 'NONE',
        --   operators = 'NONE',
        --   strings = 'NONE',
        --   types = 'NONE',
        -- },
        -- inverse = { -- Inverse highlight for different types
        --   match_paren = false,
        --   visual = false,
        --   search = false,
        -- },
        -- darken = { -- Darken floating windows and sidebar-like windows
        --   floats = false,
        --   sidebars = {
        --     enabled = true,
        --     list = {}, -- Apply dark background to specific windows
        --   },
        -- },
        -- modules = { -- List of various plugins and additional options
        --   -- ...
        -- },
      },
      -- palettes = {},
      -- specs = {},
      groups = {
        all = {
          -- FloatBorder = { fg = "#73BCD9" },
          NormalFloat        = { fg = "#a5c2cc", bg = "#00101d" }, -- Normal text in floating windows.
          CmpBorder          = { fg = "#0965ba" },
          Pmenu              = { fg = "#a5c2cc", bg = "#0C1E2C" }, -- Popup menu: normal item.
          PmenuSel           = { bg = "#133c63" },                 -- Popup menu: selected item.
          VertSplit          = { fg = "#133c63" },                 -- the column separating vertically split windows
          WinSeparator       = { fg = "#133c63" },                 -- (nvim >= 0.10) the column separating vertically split windows
          Search             = { bg = '#124066', fg = '#e2e2e2' },
          -- Search             = { fg = "#73BCD9", bg = "#24475A" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
          TabLineSel         = { fg = "#afb7ba", bg = "#f73e3e" }, -- tab pages line, active tab page label
          Visual             = { bg = '#124066', fg = '#e2e2e2' },

          TelescopeSelection = { bg = '#124066', fg = '#e2e2e2' },
          TelescopeMatching  = { fg = "#00101d", bg = '#FFAA0B' },

          InclineNormal      = { fg = "#aad2ee", bg = "#092033" },
          InclineNA          = { fg = "#68838c", bg = "#00101d" }, -- Normal text in floating windows.

        }
      },
    })

    -- setup must be called before loading
    vim.cmd('colorscheme github_dark_dimmed')
  end,
}
