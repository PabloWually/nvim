return {
	"nvim-telescope/telescope.nvim",
	event = 'VeryLazy',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
    "olacin/telescope-cc.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
		{
			"nvim-telescope/telescope-frecency.nvim",
			dependencies = { "kkharji/sqlite.lua" },
		}
	},

	opts = {
		defaults = {
			-- Searching
			set_env = { COLORTERM = "truecolor" },
			file_ignore_patterns = {
				".git/",
				"%.csv",
				"%.jpg",
				"%.jpeg",
				"%.png",
				"%.svg",
				"%.otf",
				"%.ttf",
				"%.lock",
				"__pycache__",
				"%.sqlite3",
				"%.ipynb",
				"vendor",
				"node_modules",
				"dotbot",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,               -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case",   -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
				hidden = { file_browser = true }
			},
			frecency = {
				show_scores = false,
				show_unindexed = true,
				ignores_patterns = {
					".git/",
					"*/tmp/*",
					"/node_modules/*",
					"*/vendor/*"
				},
			}
		}
	},
	config = function(opts)
		require('telescope').setup(opts)
		require('telescope').load_extension('fzf')
		require('telescope').load_extension('frecency')
    require('telescope').load_extension('conventional_commits')
	end,
	keys = {
		{
			"<leader>pp",
			function()
				require('telescope.builtin').git_files({ show_untracked = true })
			end,
			desc = "Telescope Git Files",
		},
		{
			"<leader>pe",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
		{
			"<leader>gs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Telescope Git status",
		},
		{
			"<leader>gc",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "Telescope Git status",
		},
		{
			"<leader>gb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Telescope Git branches",
		},
		{
			"<leader>rp",
			function()
				require("telescope.builtin").find_files({
					prompt_title = "Plugins",
					cwd = "~/.config/nvim/lua/plugins",
					attach_mappings = function(_, map)
						local actions = require("telescope.actions")
						local action_state = require("telescope.actions.state")
						map("i", "<c-y>", function(prompt_bufnr)
							local new_plugin = action_state.get_current_line()
							actions.close(prompt_bufnr)
							vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
						end)
						return true
					end
				})
			end
		},
		{
			"<leader>ps",
			function()
				require('telescope.builtin').find_files()
			end,
			desc = "Telescope Find Files",
		},
    {
      "<leader>pf",
      function ()
        vim.cmd(string.format("Telescope live_grep path_display=smart<CR>"))
      end,
      desc = "Telescope Fuzzy Find"
    },
		{
			"<leader>ph",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope Help"
		},
		{
			"<leader>bb",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
			end,
			desc = "Telescope file browser"
		}
	},
}
