vim.pack.add({ "https://github.com/nvim-orgmode/orgmode" })

require("orgmode").setup({
    org_agenda_files = "~/org/**/*",
    org_default_notes_file = "~/org/refile.org",
    org_startup_indented = true,
    mappings = {
        org = {
            org_cycle = { "gt", desc = "cycle fold" },
            org_global_cycle = { "gT", desc = "cycle fold global" },
        },
    },
})
