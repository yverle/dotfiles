-- TODO: debugmaster?
vim.pack.add({
    { src = "https://codeberg.org/mfussenegger/nvim-dap" },
    { src = "https://github.com/nvim-neotest/nvim-nio", version = vim.version.range("*") },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
})

local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set("n", "<leader>db", function()
    dap.toggle_breakpoint()
end, { desc = "[D]AP toggle [b]reakpoint" })

vim.keymap.set("n", "<leader>dB", function()
    dap.toggle_breakpoint(vim.fn.input("Condition: "))
end, { desc = "[D]AP toggle conditional [b]reakpoint" })

vim.keymap.set("n", "<leader>dc", function()
    dap.continue()
end, { desc = "[D]AP [c]ontinue" })

vim.keymap.set("n", "<leader>di", function()
    dap.step_into()
end, { desc = "[D]AP step [i]nto" })

vim.keymap.set("n", "<leader>do", function()
    dap.step_over()
end, { desc = "[D]AP step [o]ver" })

vim.keymap.set("n", "<leader>dO", function()
    dap.step_out()
end, { desc = "[D]AP step [o]ut" })

vim.keymap.set("n", "<leader>dq", function()
    dap.terminate()
end, { desc = "[D]AP terminate ([q]uit)" })

vim.keymap.set("n", "<leader>du", function()
    dapui.toggle()
end, { desc = "[D]AP toggle [u]i" })
