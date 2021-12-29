local present, alpha = pcall(require, 'alpha')
local present2, dashboard = pcall(require, 'alpha.themes.dashboard')
if not (present or present2) then
   return
end

dashboard.section.header.val = {
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

dashboard.section.buttons.val = {
  dashboard.button( 'SPC f r', '  > Recent files', ':Telescope oldfiles<CR>'),
  dashboard.button( 'SPC f p', '  > Open Project', ':Telescope projects<CR>'),
  dashboard.button( 'SPC f f', "  > Find file", ':Telescope find_files<CR>'),
  dashboard.button( 'SPC f e', '  > File browser', ':Telescope find_files<CR>'),
  dashboard.button( 'SPC f c', '  > Open nvim config' , ':lua require"telescope.builtin".find_files { cwd = "$HOME/.config/nvim" }<CR>'),
}

alpha.setup(dashboard.opts)
