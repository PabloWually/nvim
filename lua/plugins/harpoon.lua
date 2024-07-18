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
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>",        desc = "Add file" },
      { "A-e",      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show marks" },
      { "A-n",      "<cmd>lua require('harpoon.ui').nav_next()<CR>",          desc = "Next marked file" },
      { "A-N",      "<cmd>lua require('harpoon.ui').nav_prev()<CR>",          desc = "Previous marked file" },
      { "∑",      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show marks" },
      { "π",      "<cmd>lua require('harpoon.ui').nav_next()<CR>",          desc = "Next marked file" },
      { "∏",      "<cmd>lua require('harpoon.ui').nav_prev()<CR>",          desc = "Previous marked file" },
    }
  },
}
