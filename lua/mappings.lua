require "nvchad.mappings"

-- ===============================
-- Add your custom mappings here
-- ===============================
local map = vim.keymap.set

-- Normalmode shortcuts
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Optional: save shortcut
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- ========================================
-- Terminal mode: ESC to exit to Normalmode
-- ========================================
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
