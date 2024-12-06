-- Directory management
return {
  {
    'stevearc/oil.nvim',
    config = {},
    enabled = true,
    opts = {},
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
  },
}
