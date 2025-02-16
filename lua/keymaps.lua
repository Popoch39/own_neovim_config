vim.keymap.set("n", "<C-s>", vim.cmd.write, { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

vim.keymap.set("n", "n", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "p", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })

--TODO: test todo find 
vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", {});
