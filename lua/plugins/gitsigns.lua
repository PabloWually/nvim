return {
	"lewis6991/gitsigns.nvim",
	opts = {
		numhl = true,
		max_file_length = 10000,
		signs = {
			add = { hl = "GitSignsAdd", text = "▌" },
			change = { hl = "GitSignsChange", text = "▌" },
			delete = { hl = "GitSignsDelete", text = "▁" },
			topdelete = { hl = "GitSignsDelete", text = "▔" },
			changedelete = { hl = "GitSignsChange", text = "▁" },
			untracked = { hl = "GitSignsUntracked", text = "▌" },
		},
	}
}
