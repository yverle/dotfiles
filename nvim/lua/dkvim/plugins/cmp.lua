local present, cmp = pcall(require, 'cmp')
local present2, luasnip = pcall(require, 'luasnip')
if not (present or present2) then
  return
end

local kind_icons = {
  Text = '',
  Method = 'ƒ',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = 'ﴯ',
  Interface = '',
  Module = '',
  Property = 'ﰠ',
  Unit = '',
  Value = '',
  Enum = '了',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- completion = {
  --   completeopt = 'menu,menuone,noinsert',
  -- },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    -- ['<CR>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Insert,
    --   select = true,
    -- }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'neorg' },
    { name = 'luasnip' },
    { name = 'path' },
    {
      name = 'buffer',
      option = {
        keyword_length = 5,
      },
    },
  }),

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
    },
  }),

  cmp.setup.cmdline(':', {
    completion = {
      autocomplete = false,
    },

    sources = cmp.config.sources({
      { name = 'path' },
      {
        name = 'cmdline',
        max_item_count = 20,
        keyword_length = 4,
        -- keyword_pattern = [=[[^[:blank:]\!]*]=],
      },
    }),
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
      vim_item.kind = string.format(
        '%s %s',
        kind_icons[vim_item.kind],
        vim_item.kind
      )
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end,
  },
})
