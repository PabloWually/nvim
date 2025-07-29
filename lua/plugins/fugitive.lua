return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git" },
  keys = {
    { "<leader>ga", ":Git fetch --all -p<cr>",             desc = "Git fetch" },
    { "<leader>gl", ":Git pull origin HEAD<cr>",           desc = "Git pull current branch" },
    { "<leader>cc", ":Telescope conventional_commits<CR>", desc = "Git commit" },
  },
}
