vim.keymap.set("n", "<C-s>", vim.cmd.write, { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })
vim.keymap.set("n", "tn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "tp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", {});
vim.keymap.set("n", "<C-u>", "<C-u>zz", {});


--TODO: test todo find 
vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", {})

