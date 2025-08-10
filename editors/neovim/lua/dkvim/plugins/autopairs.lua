-- nvim-autopairs
-- https://github.com/windwp/nvim-autopairs
--
-- Automatically places closing symbols (braces, quotes, others)

return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
}
