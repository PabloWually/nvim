return {
	'goolord/alpha-nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		require("alpha.term")
		dashboard.section.header.val = {
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣄⢘⣒⣀⣀⣀⣀⠀⠀⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⣿⣛⠛⢛⣿⣿⡿⠟⠂⠀]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡀⠀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣷⣿⡆⠀]],
				[[⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀]],
				[[⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠜⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⠀⢿⣿⣿⣿⣿⠿⠿⣿⣿⡿⢿⣿⣿⠈⣿⣿⣿⡏⣠⡴⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⣠⣿⣿⣿⡿⢁⣴⣶⣄⠀⠀⠉⠉⠉⠀⢻⣿⡿⢰⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⢿⣿⠟⠋⠀⠈⠛⣿⣿⠀⠀⠀⠀⠀⠀⠸⣿⡇⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
				[[⠀⠀⢸⣿⠀⠀⠀⠀⠀⠘⠿⠆⠀⠀⠀⠀⠀⠀⣿⡇⠀⠿⠇⠀⠀⠀⠀⠀⠀⠀]],
		}

		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl = "AlphaButtonText"
			b.opts.hl_shortcut = "AlphaButtonShortcut"
			return b
		end

		dashboard.section.buttons.val = {
			button("l", "   Load session", "<cmd>lua require('persisted').load()<CR>"),
			button("n", "   New file", "<cmd>ene <BAR> startinsert <CR>"),
			button("e", "   File Explorer", "<cmd>Telescope file_browser select_buffer=true<CR>"),
			button("r", "   Recent files", "<cmd>Telescope frecuency workspace=CWD<CR>"),
			button("f", "   Find file", "<cmd>Telescope find_files hidden=true path_display=smart<CR>"),
			button("s", "󱘣   Search files", "<cmd>Telescope live_grep path_display=smart<CR>"),
			-- button("p", "   Projects", "<cmd>Telescope projects<CR>"),
			button("u", "   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
			button("q", "   Quit Neovim", "<cmd>qa!<CR>"),
		}
		dashboard.section.buttons.opts = {
			spacing = 0,
		}
		-- Footer
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- Layout
		dashboard.config.layout = {
			{ type = "padding", val = 1 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		dashboard.config.opts.noautocmd = false
		require 'alpha'.setup(dashboard.config)
	end
}
