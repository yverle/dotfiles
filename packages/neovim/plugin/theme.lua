vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
vim.pack.add({ "https://github.com/ThorstenRhau/token" })

require("tokyonight").setup({
    styles = {
        comments = { italic = false },
    },
})

require("tokyonight").setup({})

-- vim.cmd.colorscheme("tokyonight-moon")
vim.cmd.colorscheme("token-temper")
