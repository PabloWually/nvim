return {
  {
    "github/copilot.vim",
    config = function()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
}
