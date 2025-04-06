local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.o.exrc = true

if not vim.g.vscode then
  local cwd = vim.fn.getcwd()
  vim.g.augment_workspace_folders = {cwd}
  print("augment_workspace_folders:", vim.inspect(vim.g.augment_workspace_folders))
end

require("vim-options")
require("keymaps")
require("lazy").setup("plugins")
