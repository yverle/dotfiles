local present, stabilize = pcall(require, 'stabilize')
if not present then
    return
end

stabilize.setup {
  force = false, -- stabilize window even when current cursor position will be hidden behind new window
  forcemark = nil,
  ignore = {  -- do not manage windows matching these file/buftypes
    filetype = { 'help', 'list' },
    buftype = { 'terminal', 'quickfix', 'loclist', 'alpha' }
  }
}
