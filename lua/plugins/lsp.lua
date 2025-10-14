return {
	"mason-org/mason-lspconfig.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"lua_ls",
			"ts_ls",
			"jsonls",
			"omnisharp",
			-- "eslint",
		},
		handlers = {
			function(server_name)
				local lsp_utils = require("utils.lsp")
				local lspconfig = require("lspconfig")
				local opts = {
					on_attach = lsp_utils.on_attach,
					capabilities = lsp_utils.capabilities,
				}
				if server_name == "omnisharp" then
					opts.cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) }
				end
				lspconfig[server_name].setup(opts)
			end,
		},
		automatic_installation = true,
	},
}
