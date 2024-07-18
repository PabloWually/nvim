local opts = { noremap = true, silent = true }
--Change mode
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("n", "<leader>vb", "<C-v>", opts)

--Manage files and split windows
vim.keymap.set("n", "<leader>nt", ":Explore<CR>", opts)
vim.keymap.set("n", "<leader>rb", ":Telescope frecency workspace=CWD<CR>", opts)
--Open terminal
vim.keymap.set("n", "<leader>te", ":split | :terminal<CR> | 10<C-W>-", opts)
--Write files and quit
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>wq", ":wq<CR>", opts)
vim.keymap.set("n", "<leader>wa", ":wa<CR>", opts)
vim.keymap.set("n", "<leader>q", ":q<CR>", opts)
vim.keymap.set("n", "<leader>Q", ":q!<CR>", opts)
vim.keymap.set("n", "<leader>qa", ":qa<CR>", opts)
vim.keymap.set("n", "<leader>bx", ":%bdelete|edit#|bdelete#<CR>", opts)

-- tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)
-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Working whit lines
vim.keymap.set("n", "<leader>,", ":norm A,<CR>", opts)
vim.keymap.set("n", "<leader>;", ":norm A;<CR>", opts)
vim.keymap.set("n", "<CR>", "o<ESC>", opts)
vim.keymap.set("n", "<S-CR>", "O<ESC>", opts)
vim.keymap.set("n", "B", "^", opts)
vim.keymap.set("n", "E", "$", opts)

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- Functions for multiple cursors
vim.g.mc = vim.api.nvim_replace_termcodes([[y/\V<C-r>=escape(@", '/')<CR><CR>]], true, true, true)

function SetupMultipleCursors()
  vim.keymap.set(
    "n",
    "<Enter>",
    [[:nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z]],
    { remap = true, silent = true }
  )
end
