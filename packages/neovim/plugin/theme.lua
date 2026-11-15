-- vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
vim.pack.add({
    {
        src = "https://github.com/ThorstenRhau/token",
        version = vim.version.range("*"),
    },
})

require("token").setup({
    transparent = false,
    plugins = {
        blink = true,
        blink_indent = true,
        dap_ui = true,
        flash = true,
        fugitive = true,
        gitsigns = true,
        mason = true,
        oil = true,
        sidekick = true,
        snacks = true,
        todo_comments = true,
        whichkey = true,
        -- yazi = true
    },
})

vim.cmd.colorscheme("token-temper")
