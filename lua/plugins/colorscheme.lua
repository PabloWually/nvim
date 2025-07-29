return {
  {
    "sainnhe/sonokai",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- priority = 1000,
    -- lazy = false,
    -- config = function()
    --   vim.opt.background = "dark"
    --   vim.cmd.colorscheme "oxocarbon"
    -- end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- vim.cmd.colorscheme('catppuccin-latte')
      require("catppuccin").setup({
        --   custom_highlights = function(colors)
        --     local u = require("catppuccin.utils.colors")
        --     return {
        --       CursorLine = {
        --         bg = u.vary_color(
        --           { latte = u.lighten(colors.mantle, 0.10, colors.base) },
        --           u.darken(colors.surface0, 0.64, colors.base)
        --         ),
        --       },
        --     }
        --   end,
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
        }
      })
    end
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "yorik1984/newpaper.nvim",
    priority = 1000,
    config = true,
  }
}
