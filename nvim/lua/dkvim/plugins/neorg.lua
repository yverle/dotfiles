local present, neorg = pcall(require, 'neorg')
if not present then
  return
end

neorg.setup({
  load = {
    ['core.defaults'] = {},         -- Load default modules
    ['core.norg.concealer'] = {},   -- Allow for use of icons
    ['core.norg.dirman'] = {        -- Manage directories with norg
      config = {
        workspaces = {
          my_workspace = "~/neorg"
        }
      }
    },
    ['core.norg.completion'] = {    -- Completion engine
      config = {
        engine = 'nvim-cmp'
      }
    },
    ['core.keybinds'] = {           -- Keybinds
      config = {
        default_keybinds = true,
        neorg_leader = '<Leader>o'
      }
    }
  }
})
