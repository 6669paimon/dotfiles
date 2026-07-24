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
    { "hrsh7th/cmp-nvim-lsp",     event = "InsertEnter" },
    { "hrsh7th/cmp-buffer",       event = "InsertEnter" },
    { "hrsh7th/cmp-path",         event = "InsertEnter" },
    { "hrsh7th/cmp-cmdline",      event = "InsertEnter" },
    { "hrsh7th/cmp-nvim-lua",     event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
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
  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    completion = {
      autocomplete = { cmp.TriggerEvent.InsertEnter, cmp.TriggerEvent.TextChanged },
      completeopt = "menu,menuone,noselect",
    },

    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(cmp_select), { "i", "c" }),
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-c>"] = cmp.mapping.close(),
      ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
      ["<C-e>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.abort()
        end
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, true, true), "n", true)
      end, { "i", "c" }),
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
      format = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snip]",
          buffer = "[Buff]",
          nvim_lua = "[Lua]",
          path = "[Path]",
        })[entry.source.name]

        -- local max_width = 16
        -- if #vim_item.abbr > max_width then
        -- 	vim_item.abbr = vim_item.abbr:sub(1, max_width) .. "…"
        -- end

        return vim_item
      end,
    },

    sources = {
      {
        name = "nvim_lsp",
        -- keyword_pattern = [[\k\+]],
        keyword_length = 3,
        max_item_count = 10,
      },
      { name = "luasnip",  keyword_length = 2 },
      { name = "buffer",   keyword_length = 3 },
      { name = "nvim_lua", keyword_length = 2 },
      { name = "path",     keyword_length = 2 },
    },

    performance = {
      debounce = 50,
      throttle = 80,
      fetching_timeout = 200,
    },

    window = {
      completion = {
        scrollbar = true,
      },
      documentation = {
        border = border,
      },
    },

    experimental = {
      -- ghost_text = false,
      ghost_text = {
        hl_group = "Comment",
      },
    },
  })

  -- Git commit sources
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "buffer" },
    }),
  })

  -- Search
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Cmdline
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
      { name = "cmdline" },
    }),
  })
end

return M
