-- Ideally nothing should be in this file as everything here is a temporary workaround until I either find a better solution or the neovim devs fix something

-- Vim currently doesn't support Bicep as a filetype
vim.cmd([[
  autocmd BufNewFile,BufRead *.bicep set filetype=bicep
]])
