return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "moon"
  --     })
  --     vim.cmd("colorscheme rose-pine")
  --   end
  -- }

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          dark = "mocha",
          light = "mocha"
        },
      })
      vim.cmd.colorscheme "catppuccin"
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
