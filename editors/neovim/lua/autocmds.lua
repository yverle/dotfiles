local user_autocmds_augroup = vim.api.nvim_create_augroup('user_autocmds_augroup', {})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = user_autocmds_augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  group = user_autocmds_augroup,
  command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Always open help window on the right',
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

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  desc = 'Automatically create directory when saving file',
  group = user_autocmds_augroup,
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable linewrap in quickfix window',
  group = user_autocmds_augroup,
  pattern = 'qf',
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits on terminal window resize',
  group = user_autocmds_augroup,
  command = 'wincmd =',
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Better reading experience in text and md files',
  group = user_autocmds_augroup,
  pattern = { 'markdown', 'txt' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Disable line numbers and signs in terminal windows',
  group = user_autocmds_augroup,
  callback = function()
    vim.opt_local.filetype = 'terminal'
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})

-- Autocomplete can't use multiple sources yet
-- So still needs <C-X>F for example for paths
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable auto-completion on LSP attach',
  group = user_autocmds_augroup,
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    if client:supports_method 'textDocument/completion' then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
