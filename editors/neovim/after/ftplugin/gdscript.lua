vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

local port = 6005
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
local pipe = [[\\.\pipe\godot.pipe]]

local is_server_running = vim.uv.fs_stat(pipe)

if not is_server_running then
  vim.lsp.start {
    name = 'Godot',
    cmd = cmd,
    root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
    on_attach = function()
      vim.api.nvim_command([[echo serverstart(']] .. pipe .. [[')]])
    end,
  }
end
