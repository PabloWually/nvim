local wk = require("which-key")

wk.add({
  --Change mode
  {
    mode = { "i" },
    { "jj", "<ESC>", desc = "Escape Insert Mode" },
  },
  {
    mode = { "n" },
    { "<leader>vb", "<C-v>",                                 desc = "Visual Block" },
    --Manage files and split windows
    { "<leader>nt", ":Explore<CR>",                          desc = "Explore Files" },
    { "<leader>rf", ":Telescope frecency workspace=CWD<CR>", desc = "Recent Files" },
    --Open terminal
    { "<leader>te", ":split | :terminal <CR> | 10<C-W>-",    desc = "Open Terminal" },
    --Write files and quit
    { "<leader>w",  ":w<CR>",                                desc = "Save File" },
    { "<leader>wq", ":wq<CR>",                               desc = "Save and Quit" },
    { "<leader>wa", ":wa<CR>",                               desc = "Save All" },
    { "<leader>q",  ":q<CR>",                                desc = "Quit" },
    { "<leader>Q",  ":q!<CR>",                               desc = "Force Quit" },
    { "<leader>qa", ":qa<CR>",                               desc = "Quit All" },
    { "<leader>bx", ":%bdelete|edit#|bdelete#<CR>",          desc = "Delete Buffer" },
    -- Move between windows
    { "<C-h>",      "<cmd> TmuxNavigateLeft<CR>",            desc = "Navigate Left" },
    { "<C-j>",      "<cmd> TmuxNavigateDown<CR>",            desc = "Navigate Down" },
    { "<C-k>",      "<cmd> TmuxNavigateUp<CR>",              desc = "Navigate Up" },
    { "<C-l>",      "<cmd> TmuxNavigateRight<CR>",           desc = "Navigate Right" },
    -- tabs
    { "<leader>to", ":tabnew<CR>",                           desc = "New Tab" },
    { "<leader>tx", ":tabclose<CR>",                         desc = "Close Tab" },
    { "<leader>tn", ":tabn<CR>",                             desc = "Next Tab" },
    { "<leader>tp", ":tabp<CR>",                             desc = "Previous Tab" },
    -- nvim-tree
    { "<leader>e",  ":NvimTreeToggle<CR>",                   desc = "Toggle NvimTree" },
    -- Working with lines
    { "<leader>,",  ":norm A,<CR>",                          desc = "Append Comma" },
    { "<leader>;",  ":norm A;<CR>",                          desc = "Append Semicolon" },
    { "<Enter>",    "o<ESC>",                                desc = "Insert New Line Below" },
    { "B",          "^",                                     desc = "Beginning of Line" },
    { "E",          "$",                                     desc = "End of Line" },
    -- vim-maximizer
    { "<leader>sm", ":MaximizerToggle<CR>",                  desc = "Toggle Maximizer" },
  },
})
