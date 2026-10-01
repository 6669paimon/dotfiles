local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
    },
    "windwp/nvim-ts-autotag",
    "axelvc/template-string.nvim",
  },
}

function M.config()
  ---------------------------------------------------------------------------
  -- nvim-treesitter
  ---------------------------------------------------------------------------

  require("nvim-treesitter").setup()

  ---------------------------------------------------------------------------
  -- Install parsers
  ---------------------------------------------------------------------------

  local parsers = {
    "c",
    "cpp",
    "lua",
    "tsx",
    "typescript",
    "javascript",
    "html",
    "css",
    "json",
    "graphql",
    "regex",
    "rust",
    "prisma",
    "markdown",
    "markdown_inline",
    "python",
    "bash",
    "fish",
  }

  require("nvim-treesitter").install(parsers)

  ---------------------------------------------------------------------------
  -- Treesitter highlighting
  --
  -- Highlighting is now provided by Neovim itself.
  -- nvim-treesitter no longer uses:
  --
  -- highlight = {
  --   enable = true,
  -- }
  ---------------------------------------------------------------------------

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter_start", {
      clear = true,
    }),

    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
    end,
  })

  ---------------------------------------------------------------------------
  -- Treesitter indentation
  ---------------------------------------------------------------------------

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter_indent", {
      clear = true,
    }),

    callback = function()
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  ---------------------------------------------------------------------------
  -- nvim-ts-autotag
  ---------------------------------------------------------------------------

  require("nvim-ts-autotag").setup()

  ---------------------------------------------------------------------------
  -- nvim-treesitter-textobjects
  ---------------------------------------------------------------------------

  require("nvim-treesitter-textobjects").setup({
    select = {
      lookahead = true,
    },

    move = {
      set_jumps = true,
    },
  })

  local ts_select = require("nvim-treesitter-textobjects.select")
  local ts_move = require("nvim-treesitter-textobjects.move")
  local ts_swap = require("nvim-treesitter-textobjects.swap")

  ---------------------------------------------------------------------------
  -- Textobject select
  ---------------------------------------------------------------------------

  local function select_textobject(query)
    return function()
      ts_select.select_textobject(query, "textobjects")
    end
  end

  vim.keymap.set({ "x", "o" }, "af", select_textobject("@function.outer"), {
    desc = "Around function",
  })

  vim.keymap.set({ "x", "o" }, "if", select_textobject("@function.inner"), {
    desc = "Inside function",
  })

  vim.keymap.set({ "x", "o" }, "ac", select_textobject("@class.outer"), {
    desc = "Around class",
  })

  vim.keymap.set({ "x", "o" }, "ic", select_textobject("@class.inner"), {
    desc = "Inside class",
  })

  vim.keymap.set({ "x", "o" }, "ai", select_textobject("@conditional.outer"), {
    desc = "Around conditional",
  })

  vim.keymap.set({ "x", "o" }, "ii", select_textobject("@conditional.inner"), {
    desc = "Inside conditional",
  })

  vim.keymap.set({ "x", "o" }, "al", select_textobject("@loop.outer"), {
    desc = "Around loop",
  })

  vim.keymap.set({ "x", "o" }, "il", select_textobject("@loop.inner"), {
    desc = "Inside loop",
  })

  vim.keymap.set({ "x", "o" }, "ap", select_textobject("@parameter.outer"), {
    desc = "Around parameter",
  })

  vim.keymap.set({ "x", "o" }, "ip", select_textobject("@parameter.inner"), {
    desc = "Inside parameter",
  })

  ---------------------------------------------------------------------------
  -- Textobject movement
  ---------------------------------------------------------------------------

  vim.keymap.set({ "n", "x", "o" }, "[f", function()
    ts_move.goto_previous_start("@function.outer", "textobjects")
  end, {
    desc = "Previous function",
  })

  vim.keymap.set({ "n", "x", "o" }, "]f", function()
    ts_move.goto_next_start("@function.outer", "textobjects")
  end, {
    desc = "Next function",
  })

  vim.keymap.set({ "n", "x", "o" }, "[c", function()
    ts_move.goto_previous_start("@class.outer", "textobjects")
  end, {
    desc = "Previous class",
  })

  vim.keymap.set({ "n", "x", "o" }, "]c", function()
    ts_move.goto_next_start("@class.outer", "textobjects")
  end, {
    desc = "Next class",
  })

  vim.keymap.set({ "n", "x", "o" }, "[p", function()
    ts_move.goto_previous_start("@parameter.inner", "textobjects")
  end, {
    desc = "Previous parameter",
  })

  vim.keymap.set({ "n", "x", "o" }, "]p", function()
    ts_move.goto_next_start("@parameter.inner", "textobjects")
  end, {
    desc = "Next parameter",
  })

  ---------------------------------------------------------------------------
  -- Textobject swap
  ---------------------------------------------------------------------------

  vim.keymap.set("n", "<leader>a", function()
    ts_swap.swap_next("@parameter.inner")
  end, {
    desc = "Swap parameter forward",
  })

  vim.keymap.set("n", "<leader>A", function()
    ts_swap.swap_previous("@parameter.inner")
  end, {
    desc = "Swap parameter backward",
  })

  ---------------------------------------------------------------------------
  -- Repeatable movement
  ---------------------------------------------------------------------------

  local ts_repeat_move =
      require("nvim-treesitter-textobjects.repeatable_move")

  -- Vim-style:
  -- ; = repeat in same direction
  -- , = repeat in opposite direction

  vim.keymap.set(
    { "n", "x", "o" },
    ";",
    ts_repeat_move.repeat_last_move
  )

  vim.keymap.set(
    { "n", "x", "o" },
    ",",
    ts_repeat_move.repeat_last_move_opposite
  )

  ---------------------------------------------------------------------------
  -- Make f / F / t / T repeatable
  ---------------------------------------------------------------------------

  vim.keymap.set(
    { "n", "x", "o" },
    "f",
    ts_repeat_move.builtin_f_expr,
    { expr = true }
  )

  vim.keymap.set(
    { "n", "x", "o" },
    "F",
    ts_repeat_move.builtin_F_expr,
    { expr = true }
  )

  vim.keymap.set(
    { "n", "x", "o" },
    "t",
    ts_repeat_move.builtin_t_expr,
    { expr = true }
  )

  vim.keymap.set(
    { "n", "x", "o" },
    "T",
    ts_repeat_move.builtin_T_expr,
    { expr = true }
  )

  ---------------------------------------------------------------------------
  -- template-string.nvim
  ---------------------------------------------------------------------------

  require("template-string").setup({})
end

return M
