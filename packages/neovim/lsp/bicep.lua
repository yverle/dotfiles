-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/bicep.lua

local bicep_lsp_bin = vim.fn.expand("$MASON/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll")

---@type vim.lsp.Config
return {
    cmd = { "dotnet", bicep_lsp_bin },
    filetypes = { "bicep", "bicep-params" },
    root_markers = { ".git" },
    init_options = {},
}
