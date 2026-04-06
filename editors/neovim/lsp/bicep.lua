-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/bicep.lua

---@type vim.lsp.Config
return {
  filetypes = { 'bicep', 'bicep-params' },
  root_markers = { '.git' },
  init_options = {},
}
