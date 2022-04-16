vim.api.nvim_create_user_command('ToHex', '%!xxd', {})
vim.api.nvim_create_user_command('Fromhex', '%!xxd -r', {})
vim.api.nvim_create_user_command(
  'FormatXML',
  '%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"',
  {}
)
