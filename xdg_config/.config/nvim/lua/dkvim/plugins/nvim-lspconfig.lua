local present, lsp = pcall(require, 'lspconfig')
local present2, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not (present or present2) then
   return
end

-- local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- NOTE: Update these variables to the location of your language server
local sumneko_root_path = '/opt/lua-language-server/'
local bicep_lsp_bin = '/opt/bicep-langserver/Bicep.LangServer.dll'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
local sumneko_binary = sumneko_root_path .. '/bin/' .. vim.g.os .. '/lua-language-server'

-- Rust
lsp.rust_analyzer.setup {
  capabilities = capabilities,
}

-- Python
lsp.pyright.setup {
  capabilities = capabilities,
}

-- C#
-- lsp.omnisharp.setup {
--  capabilities = capabilities,
--}

-- C/C++
-- lsp.clangd.setup {
--  capabilities = capabilities,
--}

-- Typescript
lsp.tsserver.setup {
  capabilities = capabilities,
}

-- Vue
-- lsp.vuels.setup {
--   capabilities = capabilities,
-- }

-- Svelte
-- lsp.svelte.setup {
--   capabilities = capabilities,
-- }

-- CSS, SCSS and LESS
-- lsp.cssls.setup {
--   capabilities = capabilities,
-- }

-- GraphQL
-- lsp.graphql.setup {
--   capabilities = capabilities,
-- }

-- HTML
-- lsp.html.setup {
--   capabilities = capabilities,
-- }

-- TailwindCSS
-- lsp.tailwindcss.setup {
--   capabilities = capabilities,
-- }

-- Ansible
lsp.ansiblels.setup {
  capabilities = capabilities,
}

-- Dockerfile
lsp.dockerls.setup {
  capabilities = capabilities,
}

-- Terraform
lsp.terraformls.setup {
  capabilities = capabilities,
}

-- Bicep
lsp.bicep.setup {
  cmd = { 'dotnet', bicep_lsp_bin },
  capabilities = capabilities,
}

-- Bash
lsp.bashls.setup {
  capabilities = capabilities,
}

-- Powershell
lsp.powershell_es.setup {
  capabilities = capabilities,
  bundle_path = '/opt/PowerShellEditorServices',
}

-- Go
lsp.gopls.setup {
  capabilities = capabilities,
}

-- JSON
-- lsp.jsonls.setup {
--   capabilities = capabilities,
-- }

-- TOML
-- lsp.taplo.setup {
--   capabilities = capabilities,
-- }

-- YAML
-- lsp.yamlls.setup {
--   capabilities = capabilities,
-- }

-- Julia
-- lsp.julials.setup {
--   capabilities = capabilities,
-- }

-- Elixir
-- lsp.elixirls.setup {
--   capabilities = capabilities,
-- }

-- Lua
-- lsp.sumneko_lua.setup {
--   cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
--   capabilities = capabilities,
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

