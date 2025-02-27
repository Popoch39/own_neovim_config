return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules/.*", "vendor/.*" },
          find_command = { "fd", "--type", "f", "--hidden", "--no-ignore" },
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "--no-ignore",
            "--with-filename",
            "--line-number",
            "--column"
          }
        }
      })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
      vim.keymap.set('n', '<leader>bm', ":Telescope buffers<CR>")
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            },
          },
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
