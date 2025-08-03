return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {         -- set to setup table
    user_default_options = {
      css = true,  -- enable all CSS features: rgb_fn, hsl_fn, names, RRGGBB
      css_fn = true, -- enable CSS functions: rgb_fn, hsl_fn
    },
  },
}
