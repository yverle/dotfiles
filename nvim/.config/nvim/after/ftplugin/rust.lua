vim.opt_local.formatoptions:remove "o"
vim.bo.tabstop=4
vim.bo.softtabstop=4
vim.bo.shiftwidth=4

-- vim.cmd([[
-- augroup DKVIM_RUST
--   au!
--   autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
-- augroup END
-- ]])
