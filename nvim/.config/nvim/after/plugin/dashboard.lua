vim.g.dashboard_custom_header = {
  '                 ▄████████▄         ',
  '               ▄█▀▒▒▒▒▒▒▒▀██▄       ',
  '           ▄█▀▒▒▒▒▒▒▄▒▒▒▒▒▒▐█▌      ',
  '         ▄█▒▒▒▒▒▒▒▒▒▒▀█▒▒▒▄██       ',
  '       ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▀▒▒▒█▄     ',
  '     ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▄   ',
  '     ▄█▒▒▒▄██████▄▒▒▒▒▄█████▄▒▒▒▒█  ',
  '     █▒▒▒█▀░░░░░▀█ ▒▒▒█▀░░░░▀█▒▒▒█  ',
  '     █▒▒▒█░░▄░░░░▀████▀░░░▄░░█▒▒▒█  ',
  '   ▄███▄▒█▄░▐▀▄░░░░░░░░░▄▀▌░▄█▒▒███▄',
  '   █▀░░█▄▒█░▐▐▀▀▄▄▄ ▄▄▄▀▀▌▌░█▒▒█░░▀█',
  '   █░░░░█▒█░▐▐  ▄▄ █ ▄▄  ▌▌░█▒█░░░░█',
  '   █░▄░░█▒█░▐▐▄ ▀▀ █ ▀▀ ▄▌▌░█▒█░░▄░█',
  '   █░░█░█▒█░░▌▄█▄▄▀ ▀▄▄█▄▐░░█▒█░█░░█',
  '   █▄░█████████▀░░▀▄▀░░▀█████████░▄█',
  '   ██▀░░▄▀░░▀░░▀▄░░░▄▀░░▀░░▀▄░░▀██  ',
  '   ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██',
  '   █░▄░░░░░░░░░░░░░░░░░░░░░░░░░░░▄░█',
  '   █░▀█▄░░░░░░░░░░░░░░░░░░░░░░░▄█▀░█',
  '   █░░█▀███████████████████████▀█░░█',
  '   █░░█    █   █   █   █   █    █░░█',
  '   █░░░▀█▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄█▀░░░█',
  '   ▀█░░▀█▄█    █   █   █   █▄█▀░░░█▀  ',
  '    ▀█░░░▀▀█▄▄ █   █   █▄▄█▀▀░░░░█▀  ',
  '     ▀█░░░░░▀▀█████████▀▀░░░░░░█▀    ',
  '      ▀█░░░░░░░▄░░░░░░░▄░░░░░░█▀    ',
  '        ▀██▄░░░▀▀▀▀▀▀▀▀▀░░░▄██▀      ',
  '          ▀██▄▄░░░░░░░▄▄██▀        ',
  '             ▀▀███████▀▀            ',
  '                                    ',
}

vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_disable_at_vimenter = 0
vim.g.dashboard_disable_statusline = 1

vim.g.dashboard_custom_section = {
 last_session = {
   description = { ' Reload Last Session                   SPC s l' },
   command = 'SessionLoad'
 },
 find_history = {
   description = { 'ﭯ Recently Opened Files                 SPC f r' },
   command = 'Telescope oldfiles'
 },
 find_file = {
   description = { ' Open Files                            SPC f f' },
   command = 'Telescope find_files'
 },
 find_bookmarks = {
   description = { ' Open Bookmarks                        SPC f b' },
   command = 'Telescope marks'
 },
 find_project = {
   description = { ' Open Project                          SPC f p' },
   command = 'Telescope projects'
 },
 find_nvim = {
   description = { ' Open Neovim Config                    SPC f c' },
   command = 'lua require"telescope.builtin".find_files{ cwd = "$HOME/.config/nvim" }'
 }
}

vim.g.dashboard_custom_footer = {
  ''
}
