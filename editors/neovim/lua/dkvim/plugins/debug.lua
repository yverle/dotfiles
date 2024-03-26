-- DAP

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Debug Adapters via Mason
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Debuggers!
    'leoluz/nvim-dap-go',
    'nicholasmata/nvim-dap-cs',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- Ensure certain Debug Adapters are installed
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'coreclr',
      },
    }

    -- Basic debugging keymaps
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    local function get_dll()
      return coroutine.create(function(dap_run_co)
        local items = vim.fn.globpath(vim.fn.getcwd(), '**/bin/Debug/**/*.dll', 0, 1)
        local opts = {
          format_item = function(path)
            return vim.fn.fnamemodify(path, ':t')
          end,
        }
        local function cont(choice)
          if choice == nil then
            return nil
          else
            coroutine.resume(dap_run_co, choice)
          end
        end

        vim.ui.select(items, opts, cont)
      end)
    end

    -- Install language specific config
    require('dap-go').setup()
    -- require('dap-cs').setup()
    require('dap-cs').setup(
      {
        dap_configurations = {
          {
            -- Must be 'coreclr' or it will be ignored by the plugin
            type = 'coreclr',
            name = 'Attach remote',
            mode = 'remote',
            request = 'attach',
            program = get_dll,
          },
        },
        netcoredbg = {
          -- the path to the executable netcoredbg which will be used for debugging.
          -- by default, this is the 'netcoredbg' executable on your PATH.
          path = 'netcoredbg'
        }
      }
    )

    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'Launch',
        request = 'launch',
        program = get_dll()
      },
    }
  end,
}
