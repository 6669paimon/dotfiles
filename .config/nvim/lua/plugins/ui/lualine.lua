local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local color = {
    bg = "#03121c",
    bg1 = "#092033",
    fg = "#aad2ee",
    fg1 = "#b0ced9",
    fg2 = "#618cb0",
    red = "#f73e3e",
    red1 = "#E48679",
  }

  local custom_theme = {
    normal = {
      b = { bg = color.bg1, fg = color.fg1 },
      c = { bg = color.bg, fg = color.fg },
    },
    insert = {
      b = { bg = color.fg2, fg = color.bg },
      c = { bg = color.bg, fg = color.fg },
    },
    visual = {
      b = { bg = color.red, fg = color.bg },
      c = { bg = color.bg, fg = color.red1 },
    },
  }

  -- local conditions = {
  --   hide_in_width = function()
  --     return vim.fn.winwidth(0) > 80
  --   end,
  -- }

  local function lsp_status()
    local msg = "[No Active]"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return "[" .. client.name .. "]"
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
        return "ﭲ "
        -- return " "
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
      lualine_x = { "diagnostics", lsp_status, shiftwidth, "filetype", '%l:%c' },
      lualine_y = { "progress" },
      lualine_z = {},
    },
  })
end

return M
