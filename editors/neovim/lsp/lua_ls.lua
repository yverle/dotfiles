-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua

local root_markers1 = {
  '.emmyrc.json',
  '.luarc.json',
  '.luarc.jsonc',
}
local root_markers2 = {
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
}

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = vim.fn.has 'nvim-0.11.3' == 1 and { root_markers1, root_markers2, { '.git' } }
    or vim.list_extend(vim.list_extend(root_markers1, root_markers2), { '.git' }),
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
      runtime = {
        version = 'Lua 5.4',
      },
      completion = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        globals = { 'vim' },
      },
      workspace = {
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
    },
  },
}
