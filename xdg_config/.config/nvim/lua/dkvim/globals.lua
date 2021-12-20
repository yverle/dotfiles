-- Store the OS in a global
if vim.fn.has("mac") == 1 then
  vim.g.os = 'macOS'
elseif vim.fn.has("unix") == 1 then
  vim.g.os = 'Linux'
elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') then
  vim.g.os = 'Windows'
else
  vim.g.os = 'Unknown'
end

-- Store if the user is in WSL
local output = vim.fn.systemlist "uname -r"
if not not string.find(output[1] or "", "WSL") then
  vim.g.wsl = true
else
  vim.g.wsl = false
end

