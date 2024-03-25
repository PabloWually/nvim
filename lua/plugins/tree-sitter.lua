return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "HiPhish/rainbow-delimiters.nvim",
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts = {
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    autotag = {
      enable = true,
      filetypes = { "html" , "xml", "tsx", "jsx" },
    },
    indent = {
      enable = true,
    },
    rainbow = {
      enable = true,
      disable = { 'jsx', 'cpp' },
      query = 'rainbow-delimiters',
      strategy = require('rainbow-delimiters').strategy.global,
    },
    ensure_installed = {
      "lua",
      "luadoc",
      "typescript",
      "javascript",
      "python",
      "json",
      "json",
      "html",
      "htmldjango",
      "dockerfile",
      "css",
      "gitignore",
      "prisma",
      "graphql",
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        }
      }
    }
  }
}
