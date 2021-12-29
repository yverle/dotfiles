# Neovim config

These are my personal dotfiles, managed with GNU stow.

## Getting started

You **should** be able to get my config running by doing the following

- Clone my config and put it at `~/.config/nvim` (or symlink it, whatever you feel like doing)
- Open Neovim to install `packer.nvim`
- Reopen Neovim 
- Run `:PackerInstall` and `PackerSync`
- Restart Neovim one final time

You **should** just be able to clone my config and put it into your `.config/nvim` folder and then run `:PackerInstall` and `:PackerSync` to get a fully functional setup.

## File structure

The folder structure is as follows:

- `lua/dkvim/`: contains all other configuration
    - `plugins/`: contains configuration for usage in plugins
    - `disable_builtin_plugins.lua`: disables some builtin plugins
    - `keymaps.lua`: contains basic keymappings, however a large portion of the keymaps are stored in `after/plugin/which-key.lua`
    - `plugins.lua`: installs packer if not installed yet and contains a list of all installed plugins
    - `utils.lua`: helper functions
    - `workarounds.lua`: the pile of shame, only contains code that I need temporarily or as a workaround for something, ideally this file should be empty
- `plugin/`: managed by packer, gets generated when doing a `:PackerSync`
- `init.lua`: just used to load the settings, keymaps, etc, no configuration is done here.

Filetype configuration is done using the `lua/dkvim/plugins/filetype.lua` file (uses a plugin)


