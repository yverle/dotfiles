require("stabilize").setup {
  force = false, -- stabilize window even when current cursor position will be hidden behind new window
  forcemark = nil,
  ignore = {  -- do not manage windows matching these file/buftypes
    filetype = { "help", "list", "Trouble" },
    buftype = { "terminal", "quickfix", "loclist", 'dashboard' }
  }
}
