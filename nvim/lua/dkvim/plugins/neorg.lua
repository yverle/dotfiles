local present, neorg = pcall(require, 'neorg')
if not present then
  return
end

neorg.setup({
  load = {
    -- Load default modules
    ['core.defaults'] = {
      config = {
        disable = { 'core.norg.news' },
      },
    },
    -- Allow for use of icons
    ['core.norg.concealer'] = {},
    -- Manage directories with norg
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          work = '~/notes/work/',
          home = '~/notes/home/',
          gtd = '~/notes/gtd/',
        },
        autochdir = true,
        index = 'index.norg',
      },
    },
    -- Completion engine
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    -- Keybinds
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = '<Leader>o',
      },
    },
    -- Getting Things Done
    ['core.gtd.base'] = {
      config = {
        workspace = 'gtd',
        inbox = 'inbox.norg',
      },
    },
  },
})
