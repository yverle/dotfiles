-- View a file as hex or a hex file as text
vim.cmd([[
command ToHex :%!xxd
command FromHex :%!xxd -r
command FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
]])
