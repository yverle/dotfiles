-- Important, make sure to install the language servers on your machine [you can find them here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)
-- Also install the Treesitter parser using :TSInstall <lang>
-- Please make sure to check the abovementioned file to get the most up-to-date info about how to install your language server

-- I usually leave most settings default but this is helpful if you need it for any reason
local util = require('lspconfig').util

-- Sumneko Lua Variables
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- NOTE: Update these variables to the location of your language server
local sumneko_root_path = '/opt/lua-language-server/'
local bicep_lsp_bin = '/opt/bicep-langserver/Bicep.LangServer.dll'

local sumneko_binary = sumneko_root_path .. '/bin/' .. vim.g.os .. '/lua-language-server'
-- Rust
require'lspconfig'.rust_analyzer.setup{}

-- Python
require'lspconfig'.pyright.setup{}

-- C#
--require'lspconfig'.omnisharp.setup{}

-- C/C++
--require'lspconfig'.clangd.setup{}

-- Typescript
require'lspconfig'.tsserver.setup{}

-- Vue
-- require'lspconfig'.vuels.setup{}

-- Svelte
-- require'lspconfig'.svelte.setup{}

-- CSS, SCSS and LESS
-- require'lspconfig'.cssls.setup{}

-- GraphQL
-- require'lspconfig'.graphql.setup{}

-- HTML
-- require'lspconfig'.html.setup{}

-- TailwindCSS
-- require'lspconfig'.tailwindcss.setup{}

-- Ansible
require'lspconfig'.ansiblels.setup{}

-- Dockerfile
require'lspconfig'.dockerls.setup{}

-- Terraform
require'lspconfig'.terraformls.setup{}

-- Bicep
require'lspconfig'.bicep.setup{
  cmd = { 'dotnet', bicep_lsp_bin },
--  root_dir = util.root_pattern('.bicep')
}

-- Bash
require'lspconfig'.bashls.setup{}

-- Powershell
require'lspconfig'.powershell_es.setup{
  bundle_path = '/opt/PowerShellEditorServices',
}

-- Go
require'lspconfig'.gopls.setup{}

-- JSON
-- require'lspconfig'.jsonls.setup{}

-- TOML
--require'lspconfig'.taplo.setup{}

-- YAML
-- require'lspconfig'.yamlls.setup{}

-- Julia
--require'lspconfig'.julials.setup{}

-- Elixir
--require'lspconfig'.elixirls.setup{}

-- Lua
-- require'lspconfig'.sumneko_lua.setup{
--   cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file('', true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

