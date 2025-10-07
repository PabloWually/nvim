return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()`, required for `toggle()` — otherwise optional
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`
    }

    -- Required for `vim.g.opencode_opts.auto_reload`
    vim.opt.autoread = true

     -- Keymaps using which-key
     local wk = require("which-key")
     wk.add({
       { "<leader>o", group = "opencode" },
       { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, desc = "Ask about this", mode = { "n", "x" } },
       { "<leader>o+", function() require("opencode").prompt("@this") end, desc = "Add this", mode = { "n", "x" } },
       { "<leader>oe", function() require("opencode").prompt("Explain @this and its context", { submit = true }) end, desc = "Explain this", mode = { "n", "x" } },
       { "<leader>os", function() require("opencode").select() end, desc = "Select prompt", mode = { "n", "x" } },
       { "<leader>ot", function() require("opencode").toggle() end, desc = "Toggle embedded" },
       { "<leader>on", function() require("opencode").command("session_new") end, desc = "New session" },
       { "<leader>oi", function() require("opencode").command("session_interrupt") end, desc = "Interrupt session" },
     })

    -- Additional keymaps
    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("messages_half_page_up") end,
      { desc = "Messages half page up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("messages_half_page_down") end,
      { desc = "Messages half page down" })
  end,
}
