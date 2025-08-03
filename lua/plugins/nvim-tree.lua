local signs = require("utils.icons")

return {
  'nvim-tree/nvim-tree.lua',
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    update_focused_file = {
      enable = true,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = signs.LightBulb,
        info = signs.Info,
        warning = signs.Warn,
        error = signs.Error,
      },
    },
    filters = {
      dotfiles = true,
    },
    view = {
      number = true,
      relativenumber = true,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          default = signs.File,
          symlink = "",
          bookmark = signs.Bookmark,
          modified = "●",
          folder = {
            arrow_closed = signs.Expanded,
            arrow_open = signs.Collapsed,
            default = signs.FolderClosed,
            open = signs.FolderOpen,
            empty = signs.FolderEmpty,
            empty_open = signs.FolderEmptyOpen,
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = signs.GitModified,
            staged = signs.GitAdded,
            unmerged = signs.Branch,
            renamed = signs.GitRenamed,
            deleted = signs.GitRemoved,
            untracked = signs.Info,
            ignored = "",
          },
        },
      },
    },
  }
}
