-- godot.nvim
-- https://github.com/Lommix/godot.nvim
--
-- Run and debug your Godot game in neovim

return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'Lommix/godot.nvim',
    lazy = true,
    cmd = { 'GodotDebug', 'GodotBreakAtCursor', 'GodotStep', 'GodotQuit', 'GodotContinue' },
  },
}
