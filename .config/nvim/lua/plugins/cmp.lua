local border = {
  { "╭", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╮", "CmpBorder" },
  { "│", "CmpBorder" },
  { "╯", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╰", "CmpBorder" },
  { "│", "CmpBorder" },
}

local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp",      event = "InsertEnter" },
    { "hrsh7th/cmp-buffer",        event = "InsertEnter" },
    { "hrsh7th/cmp-path",          event = "InsertEnter" },
    { "hrsh7th/cmp-cmdline",       event = "InsertEnter" },
    { "hrsh7th/cmp-nvim-lua",      event = "InsertEnter" },
    { "chrisgrieser/cmp-nerdfont", event = "InsertEnter" },
    -- { "hrsh7th/cmp-emoji",         event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip",  event = "InsertEnter" },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    { "onsails/lspkind.nvim" },
  },
}

function M.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")
  local defaults = require("cmp.config.default")()
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    completion = {
      -- completion = "menu,menuone",
      -- completion = "menu,menuone,noinsert",
      -- completion = "menu,menuone,preview,noselect",
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-c>"] = cmp.mapping.close(),
      ["<C-y>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    formatting = {

      -- lazy style
      format = function(entry, item)
        item.kind = lspkind.symbolic(item.kind, { mode = 'symbol_text' })

        local widths = {
          abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
          menu = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 30,
        }

        for key, width in pairs(widths) do
          if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
          end
        end

        return item
      end,

      -- format = function(entry, vim_item)
      --   vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = 'symbol_text' })
      --
      --   vim_item.menu = ({
      --     buffer = "[Buffer]",
      --     nvim_lsp = "[LSP]",
      --     nvim_lua = "[Lua]",
      --     path = "[Path]",
      --   })[entry.source.name]
      --
      --   local max_width = 50
      --   if string.len(vim_item.abbr) > max_width then
      --     vim_item.abbr = string.sub(vim_item.abbr, 1, max_width) .. '...'
      --   end
      --
      --   return vim_item
      -- end,

    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "calc" },
      { name = "treesitter" },
      -- { name = "emoji" },
      { name = "nerdfont" },
    },
    sorting = defaults.sorting,
    window = {
      completion = {
        scrollbar = true,
      },
      documentation = {
        border = border,
        -- max_width = 50,
        -- max_height = 'number',
      },
    },
    experimental = {
      -- ghost_text = false,
      ghost_text = {
        hl_group = "Comment",
      },
    },
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = "buffer" },
    }),
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
