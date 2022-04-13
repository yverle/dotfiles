local present, zen = pcall(require, 'zen-mode')
if not present then
  return
end

zen.setup({
  window = {
    backdrop = 0.95,
    width = 90,
    height = 0.9,

    -- Disable line numbers in zen-mode
    options = {
      signcolumn = 'no',
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      list = false,
    },
  },

  -- Enables and disables some plugins when in zen-mode
  plugins = {
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    lualine = { enabled = false },
    twilight = { enabled = true },
  },
})
