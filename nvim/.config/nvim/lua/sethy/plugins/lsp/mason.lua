return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- import mason
		local mason = require("mason")
		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- NOTE: Moved from lspconfig.lua
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"gopls",
				"emmet_ls",
				"emmet_language_server",
				"eslint",
			},
			--auto install configured servers (with lspconfig)
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"pylint",
				"clangd",
				-- "eslint_d",
			},
		})

		-- NOTE: Moved from lspconfig.lua
		--
		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								-- make language server aware of run time files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,
			["emmet_language_server"] = function()
				lspconfig.emmet_language_server.setup({
					filetypes = {
						"css",
						"eruby",
						"html",
						"javascript",
						"javascriptreact",
						"less",
						"sass",
						"scss",
						"pug",
						"typescriptreact",
					},
					-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
					-- **Note:** only the options listed in the table are supported.
					init_options = {
						---@type table<string, string>
						includeLanguages = {},
						--- @type string[]
						excludeLanguages = {},
						--- @type string[]
						extensionsPath = {},
						--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
						preferences = {},
						--- @type boolean Defaults to `true`
						showAbbreviationSuggestions = true,
						--- @type "always" | "never" Defaults to `"always"`
						showExpandedAbbreviation = "always",
						--- @type boolean Defaults to `false`
						showSuggestionsAsSnippets = false,
						--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
						syntaxProfiles = {},
						--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
						variables = {},
					},
				})
			end,
		})
	end,
}
