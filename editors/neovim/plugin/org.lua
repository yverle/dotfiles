vim.pack.add({ "https://github.com/nvim-orgmode/orgmode" })

require("orgmode").setup({
    org_agenda_files = "~/org/**/*",
    org_default_notes_file = "~/org/refile.org",
    org_startup_indented = true,
})
