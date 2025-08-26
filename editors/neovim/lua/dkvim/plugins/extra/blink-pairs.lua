-- blink-pairs
-- https://github.com/Saghen/blink.pairs
--
-- Rainbow highlighting and intelligent auto-pairs for Neovim
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'saghen/blink.pairs',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*', -- (recommended) only required with prebuilt binaries

    -- download prebuilt binaries from github releases
    dependencies = 'saghen/blink.download',

    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        enabled = true,
        -- cmdline = true,
      },
      highlights = {
        enabled = true,
        -- cmdline = true,
        matchparen = {
          enabled = true,

          -- known issue where typing won't update matchparen highlight, disabled by default
          -- cmdline = false,
          -- group = 'BlinkPairsMatchParen',
        },
      },
    },
  },
}
