local wk = require("which-key")

wk.add({
  --Change mode
  {
    mode = { "i" },
    { "jj", "<ESC>", desc = "Escape Insert Mode" },
  },
  {
    mode = { "n" },
    { "<leader>vb", "<C-v>",                                                    desc = "Visual Block" },
    --Manage files and split windows
    { "<leader>nt", ":Explore<CR>",                                             desc = "Explore Files" },
    { "<leader>rf", ":Telescope frecency workspace=CWD<CR>",                    desc = "Recent Files" },
    --Open terminal
    { "<leader>te", ":split | :terminal <CR> | 10<C-W>-",                       desc = "Open Terminal" },
    --Write files and quit
    { "<leader>w",  ":w<CR>",                                                   desc = "Save File" },
    { "<leader>wq", ":wq<CR>",                                                  desc = "Save and Quit" },
    { "<leader>wa", ":wa<CR>",                                                  desc = "Save All" },
    { "<leader>q",  ":q<CR>",                                                   desc = "Quit" },
    { "<leader>Q",  ":q!<CR>",                                                  desc = "Force Quit" },
    { "<leader>qa", ":qa<CR>",                                                  desc = "Quit All" },
    { "<leader>bx", ":%bdelete|edit#|bdelete#<CR>",                             desc = "Delete Buffer" },
    -- Move between windows
    { "<C-h>",      "<cmd> TmuxNavigateLeft<CR>",                               desc = "Navigate Left" },
    { "<C-j>",      "<cmd> TmuxNavigateDown<CR>",                               desc = "Navigate Down" },
    { "<C-k>",      "<cmd> TmuxNavigateUp<CR>",                                 desc = "Navigate Up" },
    { "<C-l>",      "<cmd> TmuxNavigateRight<CR>",                              desc = "Navigate Right" },
    -- tabs
    { "<leader>to", ":tabnew<CR>",                                              desc = "New Tab" },
    { "<leader>tx", ":tabclose<CR>",                                            desc = "Close Tab" },
    { "<leader>tn", ":tabn<CR>",                                                desc = "Next Tab" },
    { "<leader>tp", ":tabp<CR>",                                                desc = "Previous Tab" },
    -- nvim-tree
    { "<leader>e",  ":NvimTreeToggle<CR>",                                      desc = "Toggle NvimTree" },
    -- Working with lines
    { "<leader>,",  ":norm A,<CR>",                                             desc = "Append Comma" },
    { "<leader>;",  ":norm A;<CR>",                                             desc = "Append Semicolon" },
    { "<Enter>",    "o<ESC>",                                                   desc = "Insert New Line Below" },
    { "B",          "^",                                                        desc = "Beginning of Line" },
    { "E",          "$",                                                        desc = "End of Line" },
    -- vim-maximizer
    { "<leader>sm", ":MaximizerToggle<CR>",                                     desc = "Toggle Maximizer" },
    { "<leader>/",  "<cmd>FzfLua live_grep<CR>",                                    desc = "Grep (Root Dir)" },
    { "<leader>:",  "<cmd>FzfLua command_history<cr>",                          desc = "Command History" },
    -- find
    { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>FzfLua files<cr>",                                    desc = "Find Files (Root Dir)" },
    { "<leader>fg", "<cmd>FzfLua git_files<cr>",                                desc = "Find Files (git-files)" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",                                 desc = "Recent" },
    -- git
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>",                              desc = "Commits" },
    { "<leader>gs", "<cmd>FzfLua git_status<CR>",                               desc = "Status" },
    { "<leader>gb", "<cmd>FzfLua git_branches<CR>",                             desc = "Branches" },
    -- search
    { '<leader>s"', "<cmd>FzfLua registers<cr>",                                desc = "Registers" },
    { "<leader>sa", "<cmd>FzfLua autocmds<cr>",                                 desc = "Auto Commands" },
    { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>",                              desc = "Buffer" },
    { "<leader>sC", "<cmd>FzfLua commands<cr>",                                 desc = "Commands" },
    { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>",                     desc = "Document Diagnostics" },
    { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>",                    desc = "Workspace Diagnostics" },
    { "<leader>sh", "<cmd>FzfLua help_tags<cr>",                                desc = "Help Pages" },
    { "<leader>sH", "<cmd>FzfLua highlights<cr>",                               desc = "Search Highlight Groups" },
    { "<leader>sj", "<cmd>FzfLua jumps<cr>",                                    desc = "Jumplist" },
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>",                                  desc = "Key Maps" },
    { "<leader>sl", "<cmd>FzfLua loclist<cr>",                                  desc = "Location List" },
    { "<leader>sM", "<cmd>FzfLua man_pages<cr>",                                desc = "Man Pages" },
    { "<leader>sm", "<cmd>FzfLua marks<cr>",                                    desc = "Jump to Mark" },
    { "<leader>sR", "<cmd>FzfLua resume<cr>",                                   desc = "Resume" },
    { "<leader>sq", "<cmd>FzfLua quickfix<cr>",                                 desc = "Quickfix List" },
  },
})
