vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Don't show mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Add a colorcolumn
vim.opt.colorcolumn = '80'

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Default Tabs (replaced by vim-sleuth)
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
-- vim.opt.smartindent = true

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
