return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "wave",
      functionsStyle = { bold = true },
      typesStyle = { italic = true },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    "sainnhe/sonokai",
    event = "VeryLazy",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    event = "VeryLazy",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
    opts = {
      default_integrations = false,
      integrations = {
        alpha = true,
        mason = false,
        cmp = true,
        copilot_vim = false,
        nvimtree = true,
        telescope = {
          enable = true,
        },
      },
    },
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    event = "VeryLazy",
  },
  {
    "yorik1984/newpaper.nvim",
    event = "VeryLazy",
  },
  {
    "EdenEast/nightfox.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        terminal_colors = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "bold",
          variables = "italic",
        },
      },
    },
  },
}
