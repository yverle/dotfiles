# Neovim config

Welcome to my Neovim config, I call it DKVIM!
This repository is basically always going to be worked on (but probably won't be pushed super often because I'm lazy). 

## Getting started

You **should** just be able to clone my config and put it into your `.config/nvim` folder and then run `:PackerInstall` and `:PackerSync` to get a fully functional setup.

## File structure

The folder structure is as follows:

- `after/`: contains configuration for plugins and filetypes
    - `ftplugin/`: configuration for individual filetype, stuff such as specific tabbing and autocommands and augroups for specific filetypes are stored here
- `lua/dkvim/`: contains all other configuration
    - `plugins/`: contains configuration for usage in plugins
    - `disable_builtin_plugins.lua`: disables some builtin plugins
    - `keymaps.lua`: contains basic keymappings, however a large portion of the keymaps are stored in after/plugin/which-key.lua
    - `plugins.lua`: installs packer if not installed yet and contains all installed plugins
    - `utils.lua`: has some helper functions
    - `workarounds.lua`: the pile of shame, only contains code that I need temporarily or as a workaround for something, ideally this file should be empty
- `plugin/`: managed by packer
- `init.lua`: just used to load the settings, keymaps, etc, no configuration is done here.