return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- graphql
		lspconfig.graphql.setup({
			capabilities = capabilities,
			filetypes = {
				"graphql",
				"gql",
			},
		})

		-- lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- prisma
		lspconfig.prismals.setup({
			capabilities = capabilities,
		})

		-- json
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			filetypes = { "json", "jsonc" },
		})

		-- python
		lspconfig.pyright.setup({
			capabilities = capabilities,
			settings = {
				pyright = {
					disableOrganizeImports = false,
					analysis = {
						useLibraryCodeForTypes = true,
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						autoImportCompletions = true,
					},
				},
			},
		})

		-- typescript
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			-- filetypes = {
			-- 	"typescript",
			-- 	"javascript",
			-- 	"typescriptreact",
			-- 	"javascriptreact",
			-- },
			-- root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
		})

		-- bash
		lspconfig.bashls.setup({
			capabilities = capabilities,
			filetypes = { "sh", "aliasrc", "zsh" },
		})

		-- css_ls
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
		})

		-- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			filetypes = {
				"typescriptreact",
				"javascriptreact",
				-- "javascript",
				-- "css",
				"sass",
				"scss",
				"less",
				"svelte",
				"vue",
				"html",
			},
			init_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					},
				},
			},
		})

		-- C/C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		vim.diagnostic.config({
			virtual_text = { prefix = "●" },
			update_in_insert = false,
			-- underline = true,
			severity_sort = true,
			-- float = {
			-- 	focusable = true,
			-- 	style = "minimal",
			-- 	border = "rounded",
			-- source = "always",
			-- 	header = "",
			-- 	prefix = "",
			-- },
		})
	end,
}
