-- Some general keybinds can be found here
-- Complex keybinds (the ones showing up on which-key) can be found in _after/plugin/which-key.lua_
-- They are stored there because which-key automatically binds them and creates entries for them
-- meaning keeping which-key organised is a lot easier

-- Set map leader
vim.g.mapleader = ' '

-- Unbind the leader key
vim.api.nvim_set_keymap(
  'n',
  '<Space>',
  '<NOP>',
  { noremap = true, silent = true }
)

-- jk > esc
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Sensible escape keys in terminal mode (seriously why is it <C-\><C-n>?)
vim.api.nvim_set_keymap(
  't',
  'jk',
  '<C-\\><C-n>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  't',
  '<Esc>',
  '<C-\\><C-n>',
  { noremap = true, silent = true }
)

-- Disable Ctrl-Z from job-controlling neovim
vim.api.nvim_set_keymap(
  'n',
  '<C-z>',
  '<NOP>',
  { noremap = true, silent = true }
)

-- Copy from cursor to end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- Keep the cursor on the same line while searching or concatting lines
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- Undo breakpoints
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '(<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true, silent = true })

-- Easy access to system clipboard
vim.api.nvim_set_keymap(
  'v',
  '<C-S-c>',
  '"+yy',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  '<C-S-v>',
  'c<Esc>"+p',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'i',
  '<C-S-v>',
  '<Esc>"+p',
  { noremap = true, silent = true }
)

-- Better window movement
vim.api.nvim_set_keymap(
  'n',
  '<C-h>',
  '<C-w>h',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<C-j>',
  '<C-w>j',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<C-k>',
  '<C-w>k',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<C-l>',
  '<C-w>l',
  { noremap = true, silent = true }
)

-- Better window resizing
vim.api.nvim_set_keymap(
  'n',
  '<M-S-h>',
  ':vertical resize -2<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<M-S-j>',
  ':resize -2<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<M-S-k>',
  ':resize =2<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<M-S-l>',
  ':vertical resize +2<CR>',
  { noremap = true, silent = true }
)

-- DAP
-- Set breakpoint
vim.api.nvim_set_keymap(
  'n',
  '<F9>',
  ':lua require("dap").toggle_breakpoint()<CR>',
  { noremap = true, silent = true }
)
-- Step over
vim.api.nvim_set_keymap(
  'n',
  '<F10>',
  ':lua require("dap").step_over()<CR>',
  { noremap = true, silent = true }
)
-- Step into
vim.api.nvim_set_keymap(
  'n',
  '<F11>',
  ':lua require("dap").step_into()<CR>',
  { noremap = true, silent = true }
)
-- Open REPL
vim.api.nvim_set_keymap(
  'n',
  '<F5>',
  ':lua require("dap").repl.toggle()<CR>',
  { noremap = true, silent = true }
)
