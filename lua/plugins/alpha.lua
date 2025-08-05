return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("alpha.term")

    local headers = require("utils.headers")
    local utils = require("utils.alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = headers.owl

    dashboard.section.buttons.val = {
      utils.button("l", "   Load session", "<cmd>lua require('persistence').load()<CR>"),
      utils.button("e", "   File Explorer", "<cmd>Telescope file_browser select_buffer=true<CR>"),
      utils.button("r", "󱈖   Recent files", "<cmd>Telescope frecency workspace=CWD<CR>"),
      utils.button("f", "󱀲   Find file", "<cmd>Telescope find_files hidden=true path_display=smart<CR>"),
      utils.button("s", "󱘣   Search files", "<cmd>Telescope live_grep path_display=smart<CR>"),
      utils.button("t", "   Git Graph", "<cmd>Flog<CR>"),
      -- TODO Config and understand projects with telescope
      -- button("p", "   Projects", "<cmd>Telescope projects<CR>"),
      utils.button("q", "󰱝   Quit Neovim", "<cmd>qa!<CR>"),
    }

    dashboard.section.buttons.opts = {
      spacing = 1,
    }

    dashboard.section.mru_cwd = {
      type = "group",
      val = {
        { type = "padding", val = 1 },
        { type = "text",    val = utils.mru_title, opts = { hl = "SpecialComment" } },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { utils.mru(1, vim.fn.getcwd()) }
          end,
          opts = { shrink_margin = true },
        },
      },
    }

    dashboard.section.greeting = {
      type = "text",
      val = utils.greeting(),
      opts = {
        hl = "AlphaFooter",
        position = "center",
      },
    }

    -- Footer
    dashboard.section.footer = {
      type = "text",
      val = utils.footer(),
      opts = {
        hl = "SpecialComment",
        position = "center",
      },
    }

    -- Layout
    dashboard.config.layout = {
      { type = "padding", val = 4 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.mru_cwd,
      { type = "padding", val = 3 },
      dashboard.section.greeting,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = false
    require 'alpha'.setup(dashboard.config)
  end
}
