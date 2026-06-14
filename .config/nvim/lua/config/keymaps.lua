-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- don't clear highlight on escape
vim.keymap.del("i", "<esc>")
vim.keymap.del("n", "<esc>")
