-- Keybinds can be found at the bottom :)
local present, wk = pcall(require, 'which-key')
if not present then
  return
end

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = {
    gc = 'Comments',
  },
  key_labels = {
    ['<space>'] = 'SPC',
    ['<cr>'] = 'RET',
    ['<tab>'] = 'TAB',
  },
  icons = {
    breadcrumb = '»',
    separator = '➜',
    group = '+',
  },
  window = {
    border = 'none', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'center', -- align columns left, center or right
  },
  ignore_missing = false,
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = 'auto',
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
})

-- Normal mode binding opts
local opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  -- Top level commands
  ['h'] = { '<cmd>Telescope help_tags<CR>', 'Show help' },
  ['g'] = { '<cmd>Neogit<CR>', 'Toggle neogit' },
  ['t'] = { ':ToggleTerm direction=float<CR>', 'Toggle a floating terminal' },
  ['T'] = {
    ':ToggleTerm direction=horizontal<CR>',
    'Toggle a horizontal terminal',
  },
  ['.'] = { ':Telescope find_files<CR>', 'Find files' },
  [','] = { ':Telescope buffers<CR>', 'Show buffers' },
  -- Buffers
  ['b'] = {
    name = 'buffer',
    ['.'] = { '<cmd>Telescope buffers<CR>', 'Show buffers' },
    ['c'] = { '<cmd>bd<CR>', 'Unload buffer' },
    ['n'] = { '<cmd>bnext<CR>', 'Next buffer' },
    ['p'] = { '<cmd>bprevious<CR>', 'Previous buffer' },
  },
  -- Code
  ['c'] = {
    name = 'code',
    ['a'] = { ':Telescope lsp_code_actions<CR>', 'Code Actions' },
    ['r'] = { ':lua vim.lsp.buf.formatting()', 'Format file' },
    ['n'] = { ':lua vim.lsp.buf.rename()<CR>', 'Rename' },
    ['d'] = { ':Telescope lsp_definitions<CR>', 'Jump to definition' },
    ['h'] = { ':lua vim.lsp.buf.hover()<CR>', 'Show documentation' },
    ['i'] = { ':Telescope lsp_implementations<CR>', 'Jump to implementation' },
    ['S'] = { ':Telescope lsp_document_symbols<CR>', 'Show symbols' },
    ['f'] = {
      ':Telescope diagnostics<CR>',
      'Show diagnostics',
    },
    ['p'] = {
      name = 'diagnostics',
      ['n'] = { ':lua vim.lsp.diagnostic.goto_next()<CR>', 'Next diagnostic' },
      ['p'] = {
        ':lua vim.lsp.diagnostic.goto_prev()<CR>',
        'Previous diagnostic',
      },
    },
  },
  ['f'] = {
    name = 'file',
    ['b'] = { ':Telescope marks<CR>', 'Show marks' },
    ['c'] = {
      ':e ' .. vim.fn.stdpath('config') .. '<CR>',
      'Open neovim config',
    },
    ['f'] = { ':Telescope find_files<CR>', 'Find files' },
    ['e'] = {
      ':lua require("telescope").extensions.file_browser.file_browser()<CR>',
      'File browser',
    },
    ['p'] = {
      ':lua require("telescope").extensions.project.project{ display_type = "full" }<CR>',
      'Find projects',
    },
    ['r'] = { ':Telescope oldfiles<CR>', 'Find recent files' },
    ['w'] = { ':Telescope live_grep<CR>', 'Find string' },
    ['t'] = {
      name = 'NvimTree',
      ['t'] = { ':NvimTreeToggle<CR>', 'Toggle NvimTree' },
      ['r'] = { ':NvimTreeRefresh<CR>', 'Refresh NvimTree' },
    },
  },
  ['s'] = {
    name = 'session',
    ['s'] = { ':SessionSave<CR>', 'Save session' },
    ['l'] = { ':SessionLoad<CR>', 'Load session' },
  },
  ['w'] = {
    name = 'window',
    ['s'] = { ':vsplit<CR>', 'Vertical split' },
    ['v'] = { ':split<CR>', 'Horizontal split' },
    ['c'] = { ':close<CR>', 'Close split' },
    ['m'] = { ':MaximizerToggle<CR>', 'Maximize split' },
  },
}

wk.register(mappings, opts)
