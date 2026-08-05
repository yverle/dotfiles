-- vim.pack.add({ { src = "https://github.com/fei6409/log-highlight.nvim", version = vim.version.range("*") } })

-- vim.api.nvim_create_autocmd("FileType", {
--     group = vim.api.nvim_create_augroup("log-highlight", { clear = true }),
--     pattern = "log",
--     once = true,
--     callback = function()
--         require("log-highlight").setup({})
--     end,
-- })
