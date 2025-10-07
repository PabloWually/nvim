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
        require("lspconfig")[server_name].setup {}
      end
    },
    automatic_installation = true,
  },
}
