return {
	'goolord/alpha-nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local if_nil = vim.F.if_nil
		local fnamemodify = vim.fn.fnamemodify
		local filereadable = vim.fn.filereadable
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
			-- TODO Config and understand persisted to use sessions
			-- button("l", "   Load session", "<cmd>lua require('persisted').load()<CR>"),
			button("e", "   File Explorer", "<cmd>Telescope file_browser select_buffer=true<CR>"),
			button("r", "󱈖   Recent files", "<cmd>Telescope frecency workspace=CWD<CR>"),
			button("f", "󱀲   Find file", "<cmd>Telescope find_files hidden=true path_display=smart<CR>"),
			button("s", "󱘣   Search files", "<cmd>Telescope live_grep path_display=smart<CR>"),
			-- TODO Config and understand projects with telescope
			-- button("p", "   Projects", "<cmd>Telescope projects<CR>"),
			button("q", "󰱝   Quit Neovim", "<cmd>qa!<CR>"),
		}
		dashboard.section.buttons.opts = {
			spacing = 0,
		}

		local function get_extension(fn)
			local match = fn:match("^.+(%..+)$")
			local ext = ""
			if match ~= nil then
				ext = match:sub(2)
			end
			return ext
		end

		local nvim_web_devicons = {
			enabled = true,
			highlight = true,
		}

		local function icon(fn)
			local nwd = require("nvim-web-devicons")
			local ext = get_extension(fn)
			return nwd.get_icon(fn, ext, { default = true })
		end

		local function file_button(fn, sc, short_fn, autocd)
			short_fn = if_nil(short_fn, fn)
			local ico_txt
			local fb_hl = {}
			if nvim_web_devicons.enabled then
				local ico, hl = icon(fn)
				local hl_option_type = type(nvim_web_devicons.highlight)
				if hl_option_type == "boolean" then
					if hl and nvim_web_devicons.highlight then
						table.insert(fb_hl, { hl, 0, #ico })
					end
				end
				if hl_option_type == "string" then
					table.insert(fb_hl, { nvim_web_devicons.highlight, 0, #ico })
				end
				ico_txt = ico .. "  "
			else
				ico_txt = ""
			end
			local cd_cmd = (autocd and " | cd %:p:h" or "")
			local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. vim.fn.fnameescape(fn) .. cd_cmd .. " <CR>")
			local fn_start = short_fn:match(".*[/\\]")
			if fn_start ~= nil then
				table.insert(fb_hl, { "Comment", #ico_txt, #fn_start + #ico_txt })
			end
			file_button_el.opts.hl = fb_hl
			return file_button_el
		end

		local default_mru_ignore = { "gitcommit" }

		local mru_opts = {
			ignore = function(path, ext)
				return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
			end,
			autocd = false
		}

		--- @param start number
		--- @param cwd string? optional
		--- @param items_number number? optional number of items to generate, default = 10
		local function mru(start, cwd, items_number, opts)
			opts = opts or mru_opts
			items_number = if_nil(items_number, 10)
			local oldfiles = {}
			for _, v in pairs(vim.v.oldfiles) do
				if #oldfiles == items_number then
					break
				end
				local cwd_cond
				if not cwd then
					cwd_cond = true
				else
					cwd_cond = vim.startswith(v, cwd)
				end
				local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
				if (filereadable(v) == 1) and cwd_cond and not ignore then
					oldfiles[#oldfiles + 1] = v
				end
			end

			local tbl = {}
			for i, fn in ipairs(oldfiles) do
				local short_fn
				if cwd then
					short_fn = fnamemodify(fn, ":.")
				else
					short_fn = fnamemodify(fn, ":~")
				end
				local file_button_el = file_button(fn, tostring(i + start - 1), short_fn, opts.autocd)
				tbl[i] = file_button_el
			end
			return {
				type = "group",
				val = tbl,
				opts = {},
			}
		end

		local function mru_title()
			return "MRU " .. vim.fn.getcwd()
		end

		-- Footer
		dashboard.section.footer.opts.hl = "AlphaFooter"

		dashboard.section.mru_cwd = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				{ type = "text",    val = mru_title, opts = { hl = "SpecialComment" } },
				{ type = "padding", val = 1 },
				{
					type = "group",
					val = function()
						return { mru(0, vim.fn.getcwd()) }
					end,
					opts = { shrink_margin = false },
				},
			},
		}

		-- Layout
		dashboard.config.layout = {
			{ type = "padding", val = 1 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.mru_cwd,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		dashboard.config.opts.noautocmd = false
		require 'alpha'.setup(dashboard.config)
	end
}
