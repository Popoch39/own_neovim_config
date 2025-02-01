return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon"
      })
      vim.cmd("colorscheme rose-pine")
    end
  }

  -- VSCODE LIKE THEME
  -- {
  --   "Mofiqul/vscode.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     require('vscode').setup({
  --     })
  --     vim.cmd.colorscheme "vscode"
  --     vim.o.background = 'dark'
  --   end
  -- },
}
