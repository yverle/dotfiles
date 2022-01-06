local present, gomove = pcall(require, 'gomove')
if not present then
  return
end

gomove.setup({
  map_defaults = false,
  reindent_mode = 'vim-move',
  move_past_end_col = false,
  ignore_indent_lh_dup = true,
})

-- vim.api.nvim_set_keymap(
--   'n',
--   '<M-h>',
--   '<Plug>GoNSMLeft',
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   'n',
--   '<M-j>',
--   '<Plug>GoNSMDown',
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   'n',
--   '<M-k>',
--   '<Plug>GoNSMUp',
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   'n',
--   '<M-l>',
--   '<Plug>GoNSMRight',
--   { noremap = true, silent = true }
-- )

vim.api.nvim_set_keymap('n', '<S-h>', '<Plug>GoNSMLeft', {})
vim.api.nvim_set_keymap('n', '<M-j>', '<Plug>GoNSMDown', {})
vim.api.nvim_set_keymap('n', '<M-k>', '<Plug>GoNSMUp', {})
vim.api.nvim_set_keymap('n', '<M-l>', '<Plug>GoNSMRight', {})

vim.api.nvim_set_keymap('x', '<M-h>', '<Plug>GoVSMLeft', {})
vim.api.nvim_set_keymap('x', '<M-j>', '<Plug>GoVSMDown', {})
vim.api.nvim_set_keymap('x', '<M-k>', '<Plug>GoVSMUp', {})
vim.api.nvim_set_keymap('x', '<M-l>', '<Plug>GoVSMRight', {})
