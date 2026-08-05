vim.pack.add({ { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") } })

require("blink.cmp").setup({
    keymap = {
        preset = "default",
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
    },

    completion = {
        documentation = {
            auto_show = true,
            window = {
                border = "rounded",
            },
        },

        menu = {
            border = "rounded",
        },
    },

    cmdline = {
        enabled = true,
        completion = {
            menu = { auto_show = true },
            ghost_text = { enabled = true },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
        },
    },

    sources = {
        -- default = { "lsp", "path", "snippets", "buffer", "dadbod", "lazydev" },
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
            lazydev = {
                name = "Lazydev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
            -- snippets = {},
            -- dadbod = {
            --     name = "Dadbod",
            --     module = "vim_dadbod.completion.blink",
            -- },
        },
    },

    fuzzy = { implementation = "lua" },
    signature = { enabled = true },
})
