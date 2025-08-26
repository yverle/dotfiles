---Get env value, with default
---@param env_var_name string
---@param default? boolean
---@return boolean
local function get_env(env_var_name, default)
  default = default or false
  local value = os.getenv(env_var_name)
  if not value then
    return default
  end
  value = value:lower()
  return value == 'true' or value == '1' or value == 'yes' or value == 'on'
end

local plugins = {
  -- This is pretty much just an updated version of Kickstart.nvim
  require 'dkvim.plugins.core',

  -- Extras
  require 'dkvim.plugins.extra',

  -- Plugins that should only be loaded on my personal device(s)
  require 'dkvim.plugins.personal',
}

local opts = {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

require('lazy').setup(plugins, opts)
