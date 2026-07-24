return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach", -- โหลดพร้อมตอน LSP attach เข้า buffer พอดี ไม่ถ่วง startup
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        foldericon = false,
      },
      lightbulb = {
        enable = false,
        enable_in_insert = false,
      },
      -- Breadcrumbs
      symbol_in_winbar = {
        enable = true,
        hide_keyword = true,
        show_file = true,
        folder_level = 1,
      },
      -- symbol_in_winbar = { enable = false },
      -- beacon = { enable = false },
      -- implement = { enable = false },
    })


    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        -- ===== ใช้ lspsaga แทน vim.lsp.buf ตัวที่มี UI สวยกว่า =====
        vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
        vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts) -- preview แบบ popup ไม่กระโดดไฟล์
        vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)          -- reference + definition รวมในหน้าต่างเดียว
        vim.keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts)
        vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
        vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts) -- symbol outline สวยๆ

        -- ===== format ยังใช้ native ตรงๆ ได้ ไม่ต้องผ่าน saga =====
        vim.keymap.set("n", "<leader>fm", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- คำสั่งเฉพาะ clangd
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.name == "clangd" then
          vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
        end
      end,
    })
  end,
}
