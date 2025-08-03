return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufReadPost",
  dependencies = {
    "mason-org/mason.nvim",
    { "neovim/nvim-lspconfig", opt = {} },
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "ts_ls",
      "jsonls",
      "eslint",
    },
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup {}
      end
    },
    automatic_installation = true,
  },
}
