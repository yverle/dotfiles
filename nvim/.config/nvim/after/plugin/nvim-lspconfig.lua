-- Important, make sure to install the language servers on your machine [you can find them here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)
-- Also install the Treesitter parser using :TSInstall <lang>
-- Please make sure to check the abovementioned file to get the most up-to-date info about how to install your language server

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- IMPORTANT: UPDATE TO THE LOCATION OF YOUR lua-language-server
local sumneko_root_path = '/opt/lua-language-server/'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

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

-- Typescript
require'lspconfig'.vuels.setup{}

-- Svelte
require'lspconfig'.svelte.setup{}

-- CSS, SCSS and LESS
require'lspconfig'.cssls.setup{}

-- GraphQL
require'lspconfig'.graphql.setup{}

-- HTML
require'lspconfig'.html.setup{}

-- TailwindCSS
require'lspconfig'.tailwindcss.setup{}

-- Ansible
require'lspconfig'.ansiblels.setup{}

-- Dockerfile
require'lspconfig'.dockerls.setup{}

-- Terraform
require'lspconfig'.terraformls.setup{}

-- Bash
require'lspconfig'.bashls.setup{}

-- Powershell
require'lspconfig'.powershell_es.setup{
  bundle_path = '/opt/PowerShellEditorServices',
}

-- JSON
require'lspconfig'.jsonls.setup{}

-- TOML
--require'lspconfig'.taplo.setup{}

-- YAML
require'lspconfig'.yamlls.setup{}

-- Julia
--require'lspconfig'.julials.setup{}

-- Elixir
--require'lspconfig'.elixirls.setup{}

-- Lua

require'lspconfig'.sumneko_lua.setup{
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Go
--require'lspconfig'.gopls.setup{}
