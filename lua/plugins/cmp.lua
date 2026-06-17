return {
	"saghen/blink.cmp",
	event = "BufReadPre",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saghen/blink.compat",
		{
			"supermaven-inc/supermaven-nvim",
			opts = {
				keymaps = {
					accept_suggestion = nil, -- Desactivado para que blink.cmp controle la inserción
				},
				disable_inline_completion = true, -- Evita el "ghost text" doble
			},
		},
	},
	version = "1.*",
	opts = {
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = vim.g.ai_cmp,
			},
		},

		signature = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "supermaven" },
			providers = {
				supermaven = {
					name = "supermaven",
					module = "blink.compat.source",
					score_offset = 100, -- Prioridad alta para que la IA sugiera rápido
					async = true,
				},
			},
		},

		cmdline = {
			enabled = true,
		},

		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
		},
		-- opts_extend = { "sources.default" },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
