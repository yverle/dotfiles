-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local present, dap = pcall(require, 'dap')
if not present then
  return
end

-- Python
dap.adapters.python = {
  type = 'executable',
  command = '/opt/DAP/debugpy/bin/python',
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    program = '${file}',
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python3'
      end
    end,
  },
}

-- C/ C++ / Rust
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/opt/DAP/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.rust = {
  {
    name = 'Launch file',
    type = 'cppdbg',
    request = 'launch',
    program = function()
      return vim.fn.input(
        'Path to executable: ',
        vim.fn.getcwd() .. '/',
        'file'
      )
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    -- setupCommands = {
    --   {
    --     text = '-enable-pretty-printing',
    --     description = 'enable pretty printing',
    --     ignoreFailures = false,
    --   },
    -- },
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input(
        'Path to executable: ',
        vim.fn.getcwd() .. '/',
        'file'
      )
    end,
    -- setupCommands = {
    --   {
    --     text = '-enable-pretty-printing',
    --     description = 'enable pretty printing',
    --     ignoreFailures = false,
    --   },
    -- },
  },
}

-- NodeJS (node-debug2)
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { '/opt/DAP/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require('dap.utils').pick_process,
  },
}

-- Go (Delve)
local godapPresent, dapgo = pcall(require, 'dap-go')
if godapPresent then
  dapgo.setup()
end

-- Lua

-- C# (netcoredbg)
dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/local/netcoredbg',
  args = { '--interpreter=vscode' },
}
dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'launch - netcoredbg',
    request = 'launch',
    program = function()
      return vim.fn.input(
        'Path to dll',
        vim.fn.getcwd() .. '/bin/Debug/',
        'file'
      )
    end,
  },
}

-- Ruby
