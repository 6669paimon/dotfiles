return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
          vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
        end,
        desc = "Harpoon | Add Mark",
      },
      {
        "<leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon | Menu",
      },
      {
        "<laeder>hn",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon | Next"
      },
      {
        "<laeder>hp",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon | Previous"
      }
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
