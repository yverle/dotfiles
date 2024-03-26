-- Statusline config
return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          statusline = { 'lazy' },
          winbar = { 'help', 'lazy' },
        },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_b = { 'grapple' }
      }
    },
  },
}
