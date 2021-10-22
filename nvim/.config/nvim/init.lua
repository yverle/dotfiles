-- Basic settings found in lua/dkvim/config/settings.lua
require('dkvim.settings')

-- All keymaps are set in lua/dkvim/keymaps.lua
require('dkvim.keymaps')

-- Disable builtin plugins I don't use (looking at you netrw)
require('dkvim.disable_builtin_plugins')

-- Installing plugins (and managing them) is done in lua/dkvim/plugins.lua
require('dkvim.plugins')

