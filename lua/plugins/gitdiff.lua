return {
  {
    'sindrets/diffview.nvim',
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
      })


      local function toggle_diffview()
        local lib = require('diffview.lib')
        -- Vérifie si une vue diff est déjà ouverte
        if lib.get_current_view() then
          -- Si oui, on ferme Diffview
          vim.cmd('DiffviewClose')
        else
          -- Si non, on ouvre Diffview
          vim.cmd('DiffviewOpen')
        end
      end

      local function toggle_file_history()
        local lib = require('diffview.lib')
        if lib.get_current_view() then
          vim.cmd('DiffviewClose')
        else
          -- Ouvre l'historique du fichier courant
          vim.cmd('DiffviewFileHistory %')
        end
      end

      vim.keymap.set('n', '<leader>gd', toggle_diffview, {
        noremap = true,
        silent = true,
        desc = "Open Diffview"
      })
      vim.keymap.set('n', '<leader>fh', toggle_file_history, {
        noremap = true,
        silent = true,
        desc = "Open Diffview"
      })
    end
  }
}
