return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
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
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
    },

    cmdline = {
      enabled = true,
    },

    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
    opts_extend = { "sources.default" },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  }
}
