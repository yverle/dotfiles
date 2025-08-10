-- obsidian.nvim
-- https://github.com/obsidian-nvim/obsidian.nvim
--
-- A community fork of the Neovim plugin for writing and navigating Obsidian vaults, written in Lua, created by epwalsh.

return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = 'G:\\My Drive\\[00] Notes\\Personal',
        },
      },
    },
  },
}
