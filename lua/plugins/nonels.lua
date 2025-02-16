return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")


      vim.diagnostic.config({
        virtual_text = {
          source = true,
          prefix = "●", -- ou "■", "▎", "●" etc
          spacing = 4,
        },
        float = {
          source = true,
          border = "rounded",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      null_ls.setup({
        sources = {
          -- Pour TypeScript
          null_ls.builtins.diagnostics.eslint_d, -- Linting plus rapide avec eslint_d
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.formatting.prettier,  -- Formattage

          null_ls.builtins.diagnostics.tsc,      -- Vérifie les types TypeScript
        },
      })

      vim.cmd([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePre *.ts,*.tsx lua vim.lsp.buf.format()
        augroup END
      ]])

      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
    end,
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
}
