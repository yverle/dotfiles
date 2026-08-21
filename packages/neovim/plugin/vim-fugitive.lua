vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gg", ":G<CR>", { desc = "Open fu[g]itive" })
vim.keymap.set("n", "<leader>gd", ":G<CR>", { desc = "[G]it [d]iffsplit" })
