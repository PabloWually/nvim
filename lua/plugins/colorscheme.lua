return {
  {
    -- 'wuelnerdotexe/vim-enfocado',
    "sainnhe/sonokai",
    lazy = false,  -- make sure we load this during startup if it is your main colorscheme
  },
  {
    "yorik1984/newpaper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = 'light'
    }
  },
}
