-- [[ Setting options ]]
-- See `:help vim.o`
-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Disable wrapping
vim.opt.wrap = false

-- Force English vim
vim.api.nvim_exec('language en_US', true)

-- Set powershell as default shell on Windows
-- See ':h shell-powershell'
if vim.fn.has('win64') or vim.fn.has('win32') then
  vim.opt.shell = vim.fn.executable 'pwsh' == 1 and 'pwsh.exe' or 'powershell.exe'
  vim.opt.shellcmdflag = '-NoLogo -NonInteractive -NoProfile -ExecutionPolicy RemoteSigned -Command '
  vim.opt.shellxquote = ''
  vim.opt.shellquote = ''
  vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s'
  vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'
end

-- [[ Disable line numbers in term mode ]]
vim.api.nvim_create_augroup('NeovimTerminal', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.filetype = 'terminal'
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
  group = 'NeovimTerminal',
})


-- Add a colorcolumn
vim.opt.colorcolumn = '80'
