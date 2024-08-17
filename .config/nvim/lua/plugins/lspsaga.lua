return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local keymap = vim.keymap

    require("lspsaga").setup({
      ui = {
        theme = "round",
        border = "rounded",
        winblend = 0,
      },
      lightbulb = {
        enable = false,
        enable_in_insert = false,
      },
      -- Breadcrumbs
      symbol_in_winbar = {
        enable = true,
        hide_keyword = true,
        show_file = false,
        folder_level = 0,
      },
      -- symbol_in_winbar = { enable = false },
      -- beacon = { enable = false },
      -- implement = { enable = false },
    })

    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
    keymap.set("n", "<leader>ol", "<cmd>Lspsaga outline<cr>")

    local builtin = require("telescope.builtin")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", "<cmd>Lspsaga code_action<cr>", opts)
        vim.keymap.set("n", "gr", builtin.lsp_references, opts)
      end,
    })

    vim.keymap.set("n", "<space>k", "<cmd>Lspsaga hover_doc<cr>", { silent = true })

    -- diagnostic signs icons
    local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    -- 		Erro = "",warn = "",Hint = "󰌶",Info = ""
  end,
}
