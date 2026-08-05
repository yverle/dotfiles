vim.api.nvim_create_user_command("CopyPathAbsolute", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
end, {})

vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, {})
