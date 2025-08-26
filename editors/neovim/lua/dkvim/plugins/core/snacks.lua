-- snacks.nvim (as well as some other folke plugins)
-- https://github.com/folke/snacks.nvim
--
-- A collection of QoL plugins for Neovim
return {
  ---@module 'lazy'
  ---@type LazySpec
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      debug = { enabled = true },
      indent = {},
      input = {},
      picker = {},
      notify = {},
      zen = {},
    },
    -- stylua: ignore
    keys = {
      { '<leader><leader>', function() Snacks.picker.buffers() end, desc = "[S]earch Buffers" },
      { '<leader>sg', function() Snacks.picker.grep() end, desc = "[S]earch [G]rep" },
      { '<leader>sw', function() Snacks.picker.grep_word() end, desc = "[S]earch [W]ord" },
      { '<leader>sh', function() Snacks.picker.help() end, desc = "[S]earch [H]elp pages" },
      { '<leader>sf', function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
      { '<leader>s.', function() Snacks.picker.recent() end, desc = "[S]earch Recent files" },
      { '<leader>su', function() Snacks.picker.undo() end, desc = "[S]earch [U]ndo history" },
      { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = "[S]earch [D]iagnostics" },
      { '<leader>sk', function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },

      { 'gd', function() Snacks.picker.lsp_definitions() end, desc = "[G]oto [D]efinition" },
      { 'gD', function() Snacks.picker.lsp_declarations() end, desc = "[G]oto [D]eclaration" },
      { 'grr', function() Snacks.picker.lsp_references() end, nowait = true, desc = "[G]oto [R]eferences" },
      { 'gI', function() Snacks.picker.lsp_implementations() end, desc = "[G]oto [I]mplementations" },
      { 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = "[G]oto T[y]pe Definition" },
      { '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = "[S]earch LSP [S]ymbols" },
      { '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = "[S]earch LSP Workspace [S]ymbols" },
    },
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    -- stylua: ignore
  },
}
