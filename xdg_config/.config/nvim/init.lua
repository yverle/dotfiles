if vim.fn.has('nvim-0.6') == 0 then
  error('Need NVIM 0.6+ in order to run DKVIM')
end

-- Disable builtin plugins I don't use (looking at you netrw)
require('dkvim.disable_builtin_plugins')

-- Loads some predefined globals that get used in the config later
require('dkvim.globals')

-- Installing plugins (and managing them) is done in lua/dkvim/plugins.lua
require('dkvim.plugins')

-- Basic settings found in lua/dkvim/settings.lua
require('dkvim.settings')

-- Only contains basic (non-plugin) keymaps, for plugin keymaps see lua/dkvim/plugins/which-key.lua
require('dkvim.keymaps')

-- The pile of shame! Everything here should eventually be removed as they are temporary workarounds for missing features or my own stupidity
require('dkvim.workarounds')
