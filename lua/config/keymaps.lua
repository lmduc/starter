-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy the relative file path
vim.keymap.set("n", "<leader>cp", function()
  local relpath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
  vim.fn.setreg("+", relpath)
  print("Copied: " .. relpath)
end, { desc = "Copy relative path" })
