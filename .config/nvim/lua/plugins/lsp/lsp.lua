return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mason setup
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
          border = "rounded",
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "lua_ls" },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      -- ============================================
      -- ===== C/C++ (clangd) — ตั้งค่าละเอียด =====
      -- ============================================
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index", -- index ทั้งโปรเจกต์ตอนเปิด
          "--clang-tidy",       -- เปิด linter ในตัว
          "--completion-style=detailed",
          "--fallback-style=llvm",
          "--function-arg-placeholders",
          "--header-insertion=iwyu", -- auto insert #include ที่จำเป็น
          "--all-scopes-completion",
          "--cross-file-rename",
          "-j=" .. (vim.uv.available_parallelism() or 4),
          -- "-j=4", -- จำนวน worker thread ตอน index
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_markers = {
          "compile_commands.json",
          "compile_flags.txt",
          ".clangd",
          ".git",
        },
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          offsetEncoding = { "utf-16" }, -- กัน error กรณีชน null-ls/อื่นๆ
        }),
      })

      -- ===== Python =====
      vim.lsp.config("pyright", {})

      -- ===== Lua =====
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.enable({ "clangd", "pyright", "lua_ls" })

      -- ===== Keymaps ผ่าน LspAttach =====
      -- vim.api.nvim_create_autocmd("LspAttach", {
      --   callback = function(args)
      --     local opts = { buffer = args.buf, silent = true }
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      -- vim.keymap.set("n", "<leader>f", function()
      --   vim.lsp.buf.format({ async = true })
      -- end, opts)

      -- เฉพาะ clangd: สลับ .c <-> .h ได้
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     if client and client.name == "clangd" then
      --       vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
      --     end
      --   end,
      -- })

      -- Diagnostic configuration
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
          },
        },
        virtual_text = {
          prefix = "●",
          source = "if_many",
        },
        float = {
          source = true,
          focusable = false,
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
        -- underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  -- ปลั๊กอินเสริมสำหรับ clangd โดยเฉพาะ (extension UI, inlay hints ฯลฯ)
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    opts = {
      inlay_hints = {
        inline = false,
        show_parameter_hints = true,
      },
      ast = { role_icons = {}, kind_icons = {} },
    },
  },
}
