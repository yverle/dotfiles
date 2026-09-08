-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Quickfix
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", { desc = "Previous quickfix" })
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })

-- Terminal mode stuff
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Move cursor up", expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Move cursor down", expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic in floating window" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list}" })

-- Blackhole single x
vim.keymap.set("n", "x", '"_x', { desc = "Blackhole character" })

-- Blackhole changes
vim.keymap.set("n", "c", '"_c', { desc = "Blackhole change" })

-- Swap to alternate buffer
vim.keymap.set("n", "<leader>,", "<C-6>", { desc = "Switch to alternate buffer" })

-- Center my damn screen when I jump
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor centered" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center cursor" })

-- Move code blocks around in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Redo on U
vim.keymap.set({ "v", "x" }, "U", vim.cmd.redo, { desc = "Redo" })

-- Copy from cursor to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line", silent = true })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting buffer" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without overwriting buffer" })

-- Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank until end of line to system clipboard" })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
