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
  dashboard.button('SPC f r', '  > Recent files', ':Telescope oldfiles<CR>'),
  dashboard.button(
    'SPC f p',
    '  > Open Project',
    ':lua require("telescope").extensions.project.project{ display_type = "full" }<CR>'
  ),
  dashboard.button('SPC f f', '  > Find file', ':Telescope find_files<CR>'),
  dashboard.button(
    'SPC f e',
    '  > File browser',
    ':lua require("telescope").extensions.file_browser.file_browser()<CR>'
  ),
  dashboard.button(
    'SPC f c',
    '  > Open nvim config',
    ':e ' .. vim.fn.stdpath('config') .. '<CR>'
  ),
}

alpha.setup(dashboard.opts)
