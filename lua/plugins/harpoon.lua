return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      harpoon.setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 100,
        },
      })

      local keymap = vim.keymap.set
      keymap("n", "<leader>a", function() mark.add_file() end, { desc = "Harpoon: Marquer la ligne actuelle" })
      keymap("n", "<leader>da", function() mark.clear_all() end, { desc = "Harpoon: Supprimer toutes les marques" })
      keymap("n", "<leader>z", function() mark.rm_file() end, { desc = "Harpoon: Supprimer la marques" })

      keymap("n", "<C-e>", function() ui.toggle_quick_menu() end, { desc = "Harpoon: Ouvrir le menu" })

      -- Aller aux fichiers marqués rapidement
      keymap("n", "<S-q>", function() ui.nav_file(1) end, { desc = "Harpoon: Aller au fichier 1", noremap = true })
      keymap("n", "<S-s>", function() ui.nav_file(2) end,
        { desc = "Harpoon: Aller au fichier 2", noremap = true, remap = true })
      keymap("n", "<S-d>", function() ui.nav_file(3) end, { desc = "Harpoon: Aller au fichier 3", noremap = true })
      keymap("n", "<s-f>", function() ui.nav_file(4) end, { desc = "Harpoon: Aller au fichier 4", noremap = true })

      keymap("n", "<leader><leader>", function()
        vim.cmd("buffer #")
      end, { desc = "Aller au dernier buffer" })
    end
  },
}
