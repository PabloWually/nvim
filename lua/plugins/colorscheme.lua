return {
  {
    -- 'wuelnerdotexe/vim-enfocado',
    "sainnhe/sonokai",
  },
  { 
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('catppuccin-latte')
      end
  },
  {
    "yorik1984/newpaper.nvim",
    priority = 1000,
    opts = {
      style = 'dark',
    }
  },
}
