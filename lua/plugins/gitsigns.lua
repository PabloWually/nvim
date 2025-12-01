return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  dependencies = { "folke/which-key.nvim" },
  opts = {
    numhl = true,
    max_file_length = 10000,
    signs = {
      add = { text = "▌" },
      change = { text = "▌" },
      delete = { text = "▁" },
      topdelete = { text = "▔" },
      changedelete = { text = "▁" },
      untracked = { text = "▌" },
    },
    signs_staged = {
      add = { text = "▌" },
      change = { text = "▌" },
      delete = { text = "▁" },
      topdelete = { text = "▔" },
      changedelete = { text = "▁" },
      untracked = { text = "▌" },
    },
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local wk = require("which-key")

      wk.register({
        mode = "n",
        ["]c"] = {
          function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end,
          "Next hunk",
          { expr = true },
        },
        ["[c"] = {
          function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end,
          "Previous hunk",
          { expr = true },
        },
        ["<leader>h"] = {
          name = "+git",
          s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
          r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
          S = { gs.stage_buffer, "Stage Buffer" },
          u = { gs.undo_stage_hunk, "Undo Stage Hunk" },
          R = { gs.reset_buffer, "Reset Buffer" },
          p = { gs.preview_hunk, "Preview Hunk" },
          b = { function() gs.blame_line({ full = true }) end, "Blame Line" },
          d = { gs.diffthis, "Diff This" },
          D = { function() gs.diffthis("~") end, "Diff This (HEAD)" },
        },
        ["<leader>t"] = {
          name = "+toggle",
          b = { gs.toggle_current_line_blame, "Toggle Blame" },
          d = { gs.toggle_deleted, "Toggle Deleted" },
        },
      }, { buffer = bufnr })

      wk.register({
        mode = "v",
        ["<leader>h"] = {
          name = "+git",
          s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
          r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
        },
      }, { buffer = bufnr })

      wk.register({
        mode = { "o", "x" },
        ih = { ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk" },
      }, { buffer = bufnr })
    end,
  }
}
