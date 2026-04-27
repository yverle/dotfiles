-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/terraform_lsp.lua

---@type vim.lsp.Config
return {
    cmd = { "terraform-lsp" },
    filetypes = { "terraform", "hcl" },
    root_markers = { ".terraform", ".git" },
}
