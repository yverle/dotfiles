vim.pack.add { { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '^1' } }

require('blink.cmp').setup {
  keymap = {
    preset = 'default',
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },

  completion = {
    documentation = {
      auto_show = true,
      window = {
        border = 'rounded',
      },
    },

    menu = {
      border = 'rounded',
    },
  },

  cmdline = {
    completion = {
      list = {
        selection = { preselect = false, auto_insert = true },
      },
      menu = { auto_show = true },
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },

  -- snippets = { preset = 'luasnip' },

  -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
  -- which automatically downloads a prebuilt binary when enabled.
  --
  -- By default, we use the Lua implementation instead, but you may enable
  -- the rust implementation via `'prefer_rust_with_warning'`
  --
  -- See :h blink-cmp-config-fuzzy for more information
  fuzzy = { implementation = 'lua' },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },
}
