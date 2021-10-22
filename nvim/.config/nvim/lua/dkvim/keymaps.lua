-- Some general keybinds can be found here
-- Complex keybinds (the ones showing up on which-key) can be found in _after/plugin/which-key.lua_
-- They are stored there because which-key automatically binds them and creates entries for them
-- meaning keeping which-key organised is a lot easier

-- Set map leader
vim.g.mapleader = ' '

-- NOTE(Ye): Remove this when Which Key is installed
vim.api.nvim_set_keymap('n', ' ', '<NOP>', { noremap = true, silent = true })

-- jk > esc
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Disable Ctrl-Z from job-controlling neovim
vim.api.nvim_set_keymap('n', '<C-z>', '<NOP>', { noremap = true, silent = true })

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
vim.api.nvim_set_keymap('v', '<C-S-c>', '"+yy', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-S-v>', 'c<Esc>"+p', { noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-S-v>', '<Esc>"+p', { noremap = true, silent = true})

-- Unbind the leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })

-- Better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true})

-- Better split resizing
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-k>', ':resize =2<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true, silent = true})

