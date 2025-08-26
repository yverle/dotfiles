local user_autocmds_augroup = vim.api.nvim_create_augroup('user_autocmds_augroup', {})

-- Highlight when yanking text
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = user_autocmds_augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Jump to last position when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  group = user_autocmds_augroup,
  command = 'silent! normal! g`"zv',
})

-- Always open help on the right
-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = user_autocmds_augroup,
  pattern = { '*.txt' },
  callback = function()
    if vim.o.filetype ~= 'help' then
      return
    end

    local function has_diffview_in_current_tab()
      return vim.tbl_contains(
        vim.tbl_map(function(win)
          return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
        end, vim.api.nvim_tabpage_list_wins(0)),
        'DiffviewFiles'
      )
    end

    if has_diffview_in_current_tab() then
      return
    end

    vim.cmd.wincmd 'L'
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = user_autocmds_augroup,
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
