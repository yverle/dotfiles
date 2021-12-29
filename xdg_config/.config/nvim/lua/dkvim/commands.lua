-- View a file as hex or a hex file as text
vim.cmd([[
command ToHex :%!xxd
command FromHex :%!xxd -r
]])
