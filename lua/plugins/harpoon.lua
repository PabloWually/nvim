return {
  {
    "letieu/harpoon-lualine",
    dependencies = { "ThePrimeagen/harpoon" },
  },
  {
    'ThePrimeagen/harpoon',
    lazy = false,
    config = true,
    keys = {
      { "<C-e>",      "<cmd>Telescope harpoon marks<CR>",                       desc = "Show marks whit telescope" },
      { "<A-e>",      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show marks" },
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>",        desc = "Add file" },
      { "<A-n>",      "<cmd>lua require('harpoon.ui').nav_next()<CR>",          desc = "Next marked file" },
      { "<A-p>",      "<cmd>lua require('harpoon.ui').nav_prev()<CR>",          desc = "Previous marked file" },
    }
  },
}
