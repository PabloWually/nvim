return {
  "nvim-telescope/telescope.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "olacin/telescope-cc.nvim",
  },

  opts = {
    defaults = {
      -- Appearance
      path_display = "smart",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          size = {
            width = "90%",
            height = "60%",
          },
        },
        center = {
          anchor = "N",
          width = 0.9,
          preview_cutoff = 10,
        },
        vertical = {
          size = {
            width = "90%",
            height = "90%",
          },
        },
      },
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
      file_browser = {
        theme = "dropdown"
      }
    }
  },
  config = function(opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('conventional_commits')
  end,
  keys = {
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
      "<leader>bb",
      function()
        require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
      end,
      desc = "Telescope file browser"
    }
  },
}
