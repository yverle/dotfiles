local M = {}

function M.create_augroup(autocmds, name)
    vim.cmd('augroup' .. name)
    vim.cmd('autocmd!')

    for _, autocmd in ipairs(autocmds) do
        vim.cmd('autocmd ' .. table.concat(autocmd, ' '))
    end

    vim.cmd('augroup end')
end

function M.is_wsl()
  local output = vim.fn.systemlist 'uname -r'
  return not not string.find(output[1] or '', 'WSL')
end

return M
