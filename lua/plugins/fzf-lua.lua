return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    winopts = {
      height     = 0.85,
      width      = 0.85,
      border     = "rounded",
      treesitter = {
        enabled    = true,
        fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
      },
      preview    = {
        vertical     = "down:70%",
        horizontal   = "right:60%",
        layout       = "flex",
        flip_columns = 100,
        winopts      = {
          number         = true,
          relativenumber = false,
          cursorline     = true,
          cursorlineopt  = "both",
          cursorcolumn   = false,
          signcolumn     = "no",
          list           = false,
          foldenable     = false,
          foldmethod     = "manual",
        },
      },
    },
    fzf_opts = {
      ["--pointer"] = "➤",
      ["--marker"] = "✓",
    },
    fzf_colors = {
      true,
      ["hl"] = 0,
      ["hl+"] = 0,
      ["spinner"] = 0,
      ["pointer"] = 0,
      ["marker"] = 0,
      ["header"] = 0,
      ["info"] = 0,
      ["prompt"] = 0,
      ["hl-group"] = 0,
    },
    files = {
      prompt = "Files> ",
      file_icons = true,
      color_icons = true,
    },
    live_grep = {
      prompt = "Grep> ",
      rg_opts = "--column --line-number --no-heading --color=always --smart-case",
    },
    git = {
      status = {
        prompt = "Git Status> ",
        file_icons = true,
        color_icons = true,
      },
      branches = {
        prompt = "Git Branches> ",
        file_icons = true,
        color_icons = true,
      },
      commits = {
        prompt = "Git Commits> ",
        file_icons = true,
        color_icons = true,
      },
    },
  }
}
