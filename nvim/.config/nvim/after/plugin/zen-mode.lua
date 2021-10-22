require('zen-mode').setup {
  window = {
    backdrop = 0.95,
    width = 140,
    height = 0.9,

    -- Disable line numbers in zen-mode
    options = {
      number = false,
      relativenumber = false,
      -- cursorline = false
      -- cursorcolumn = '0'
    },
  },

  -- Enables and disables some plugins when in zen-mode
  plugins = {
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    lualine = { enabled = false },
    twilight = { enabled = true },
  },

  -- Callback where you add custom code when the zen-mode window opens
  --[[
  on_open = function(win)

  end,
  --]]

  -- Callback where you add custom code when the zen-mode window closes
  --[[
  on_close = function(win)

  end
  --]]
}
