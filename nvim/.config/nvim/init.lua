-- Loads some predefined globals that get used in the config later
require('dkvim.globals')

-- Basic settings found in lua/dkvim/settings.lua
require('dkvim.settings')

-- All keymaps are set in lua/dkvim/keymaps.lua
require('dkvim.keymaps')

-- Disable builtin plugins I don't use (looking at you netrw)
require('dkvim.disable_builtin_plugins')

-- Installing plugins (and managing them) is done in lua/dkvim/plugins.lua
require('dkvim.plugins')

-- The pile of shame! Everything here should eventually be removed as they are temporary workarounds for missing features or my own stupidity
require('dkvim.workarounds')
