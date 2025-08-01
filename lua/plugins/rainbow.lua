return {
  "HiPhish/rainbow-delimiters.nvim",
  event = 'VeryLazy',
  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'
    local strategy = {
      [''] = rainbow_delimiters.strategy['global'],
      commonlisp = rainbow_delimiters.strategy['local'],
    }
    local query = {
      [''] = 'rainbow-delimiters',
      latex = 'rainbow-blocks',
    }
    local highlight = {
      'RainbowDelimiterRed',
      'RainbowDelimiterYellow',
      'RainbowDelimiterBlue',
      'RainbowDelimiterOrange',
      'RainbowDelimiterGreen',
      'RainbowDelimiterViolet',
      'RainbowDelimiterCyan',
    }
    local blacklist = { 'c', 'cpp' }
    require('rainbow-delimiters.setup').setup {
      strategy = strategy,
      query = query,
      highlight = highlight,
      blacklist = blacklist
    }
  end
}
