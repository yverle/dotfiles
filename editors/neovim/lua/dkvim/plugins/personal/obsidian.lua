-- obsidian.nvim
-- https://github.com/obsidian-nvim/obsidian.nvim
--
-- A community fork of the Neovim plugin for writing and navigating Obsidian vaults, written in Lua, created by epwalsh.

return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    keys = {
      { '<leader>so', '<cmd>Obsidian search<CR>', desc = '[S]earch [O]bsidian' },
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = 'personal',
          path = 'G:\\My Drive\\[00] Notes\\Personal',
        },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
      },
      picker = {
        name = 'snacks.pick',
      },
    },
  },
}
