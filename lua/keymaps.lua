vim.keymap.set("n", "<C-s>", vim.cmd.write, { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })
vim.keymap.set("n", "tn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "tp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", {});
vim.keymap.set("n", "<C-u>", "<C-u>zz", {});

--TODO: test todo find
vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", {})
vim.keymap.set("n", "<leader>ll", function()
  local word = vim.fn.expand("<cword>") -- Récupère le mot sous le curseur
  local log_statement = string.format("console.log('%s : ', %s);", word, word)
  vim.api.nvim_put({ log_statement }, "l", true, true)
end, { desc = "Ajoute un console.log() autour du mot sous le curseur" })

vim.keymap.set("v", "<leader>ls", function()
  vim.cmd('normal! "vy') -- Copie la sélection dans le registre v
  local word = vim.fn.getreg("v") -- Récupère le mot sélectionné
  local log_statement = string.format("console.log('%s : ', %s);", word, word)
  vim.api.nvim_put({ log_statement }, "l", true, true)
end, { desc = "Ajoute un console.log() autour de la sélection" })
