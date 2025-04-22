vim.keymap.set("n", "<C-s>", vim.cmd.write, { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })
vim.keymap.set("n", "tn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "tp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", {});
vim.keymap.set("n", "<C-u>", "<C-u>zz", {});

--TODO: test todo find
vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", {})

vim.keymap.set("n", "<leader>tc", ":Augment chat-toggle<CR>", {  desc = " ai chat", silent = true })
vim.keymap.set({"n", "v"}, "<leader>cc", ":Augment chat<CR>", {  desc = " prompt ai", silent = true })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix", silent = true })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz", { desc = "Previous Quickfix", silent = true });

vim.keymap.set("n", "<leader>ld", function()
  vim.diagnostic.setqflist()
  vim.cmd("Trouble quickfix")
end, { desc = "Diagnostics LSP dans Quickfix via Trouble" })
