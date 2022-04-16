# Neovim config
My Neovim for coding, note-taking and general text editing (for example IaC configuration)

## Getting started

You **should** be able to get my config running by doing the following
This probably won't work on Windows without WSL, I haven't tested it yet

- Clone my config and put it at `~/.config/nvim` (or symlink it, whatever you feel like doing)
- Open Neovim to install `packer.nvim`
- Reopen Neovim 
- Run `:PackerInstall` and `PackerSync`
- Restart Neovim one final time

## File structure

The folder structure is as follows:

- `lua/dkvim/`: main configuration
  - `plugins/`: individual plugin configs
  - `settings.lua`: vim.o settings
  - `disable_builtin_plugins.lua`: disables some builtin plugins
  - `keymaps.lua`: basic keymappings, however a large portion of the keymaps are stored in `lua/dkvim/plugins/which-key.lua`
  - `plugins.lua`: plugin installation and lazy loading
  - `utils.lua`: helper functions
  - `workarounds.lua`: the pile of shame, only contains code that I need temporarily or as a workaround for something, ideally this file should be empty
- `plugin/`: managed by packer, gets generated when doing a `:PackerSync`
- `after/`
  - `ftplugin/`: per filetype configuration, I use this to set up autocommands and modify vim.o/vim.bo settings (for example using tabs in Golang)
- `init.lua`: initialises all other configuration
