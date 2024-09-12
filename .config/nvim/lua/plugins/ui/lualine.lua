local M = {
  "nvim-lualine/lualine.nvim",
}

local function truncate_string(str, max_length)
  if #str > max_length then
    return string.sub(str, 1, max_length) .. "…"
  else
    return str
  end
end

function M.config()
  local color = {
    bg = "#03121c",
    bg1 = "#092033",
    fg = "#aad2ee",
    fg1 = "#b0ced9",
    red = "#f73e3e",
    red1 = "#E48679",
  }

  local custom_theme = {
    normal = {
      b = { bg = color.bg1, fg = color.fg1 },
      c = { bg = color.bg, fg = color.fg },
      x = { bg = color.bg, fg = color.fg },
    },
    visual = {
      b = { bg = color.red, fg = color.bg },
      c = { bg = color.bg, fg = color.red1 },
    },
  }

  --[[ local conditions = {
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
  } ]]

  local modules = require('lualine_require').lazy_require { utils = 'lualine.utils.utils' }
  local function icon_file()
    local filename = vim.fn.expand('%:t')
    local devicons = require('nvim-web-devicons')
    local icon, icon_highlight_group = devicons.get_icon(filename)
    if icon == nil then
      icon, icon_highlight_group = devicons.get_icon_by_filetype(vim.bo.filetype)
    end
    if icon == nil and icon_highlight_group == nil then
      icon = ''
      icon_highlight_group = 'DevIconDefault'
    end
    local icon_color = modules.utils.extract_highlight_colors(icon_highlight_group, 'fg')
    icon_highlight_group = icon_highlight_group .. "lualine"
    vim.api.nvim_set_hl(0, icon_highlight_group, { fg = icon_color, bg = color.bg })
    if filename == "" then
      filename = "[No name]"
    end
    local mode_map = {
      v = "lualine_c_visual",
      V = "lualine_c_visual",
    }
    local mode_info = vim.api.nvim_get_mode()
    local mode = mode_map[mode_info.mode] or "lualine_c_normal"

    filename = string.format(
      '%%#%s#%s%%#' .. mode .. '# %s',
      icon_highlight_group,
      icon,
      filename
    )
    local modified
    if vim.bo.modified then
      modified = ' [+]'
    else
      modified = ''
    end
    -- local readonly
    -- if vim.bo.readonly then
    --   readonly = string.format('%%#lualine_c_visual# ')
    -- else
    --   readonly = ''
    -- end

    -- return modified .. filename
    return filename .. modified
  end

  local function lsp_status()
    local msg = " [No active]"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return " " .. truncate_string(client.name, 8)
      end
    end
    return msg
  end

  local mode_icons = {
    "mode",
    fmt = function(str)
      local mode = str:sub(1, 1)
      if "N" == mode then
        return "󰀘 "
      elseif "I" == mode then
        -- return "ﭲ "
        return " "
      elseif "V" == mode then
        return " "
      elseif "C" == mode then
        return " "
      end
    end
  }

  local branch = {
    "branch",
    icon = "",
    -- color = { fg = "" },
    -- cond = conditions.hide_in_width,
  }

  local diff = {
    "diff",
    symbols = { added = " ", modified = " ", removed = " " }
  }

  local function shiftwidth()
    return "ﲒ " .. vim.bo.shiftwidth
  end

  require("lualine").setup({
    options = {
      theme = custom_theme,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },

    sections = {
      lualine_a = {},
      lualine_b = { mode_icons },
      lualine_c = { branch, diff },
      lualine_x = { "diagnostics", icon_file, shiftwidth, lsp_status, '%l:%c' },
      -- lualine_x = { "diagnostics", "filename", '%l:%c' },
      -- lualine_x = { "diagnostics", lsp_status, shiftwidth, "filetype", '%l:%c' },
      lualine_y = { "progress" },
      lualine_z = {},
    },
  })
end

return M
