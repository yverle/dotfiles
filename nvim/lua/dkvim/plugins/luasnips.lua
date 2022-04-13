if vim.g.snippets ~= 'luasnip' then
  return
end

local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config({
  -- Remember to keep around the last snippet
  history = true,

  -- Update dynamic snippets as you type
  updateevents = 'TextChanged,TextChangedI',

  -- Autosnippets
  enable_autosnippets = false,
})
