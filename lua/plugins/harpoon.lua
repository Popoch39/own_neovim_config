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

      -- Table locale pour stocker les positions des lignes
      local line_positions = {}

      vim.fn.sign_define("HarpoonMarker", { text = "⚓", texthl = "DiagnosticInfo" })

      local harpoon_augroup = vim.api.nvim_create_augroup("HarpoonLineMarker", { clear = true })

      local function add_file_with_line()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        local current_line = cursor_pos[1]
        local current_file = vim.fn.expand("%:p")

        mark.add_file()

        line_positions[current_file] = current_line
        vim.notify("Fichier marqué à la ligne " .. current_line, vim.log.levels.INFO)
        vim.fn.sign_unplace("HarpoonMarkerGroup", { buffer = vim.fn.bufnr() })
        vim.fn.sign_place(0, "HarpoonMarkerGroup", "HarpoonMarker", vim.fn.bufnr(), { lnum = current_line })
      end

      local function update_harpoon_markers()
        vim.fn.sign_unplace("HarpoonMarkerGroup", { buffer = vim.fn.bufnr() })

        local current_file = vim.fn.expand("%:p")
        local idx = mark.get_index_of(current_file)

        if idx and idx > 0 then
          local line_pos = line_positions[current_file] or 1

          vim.fn.sign_place(0, "HarpoonMarkerGroup", "HarpoonMarker", vim.fn.bufnr(), { lnum = line_pos })

          vim.g.harpoon_current_index = idx
          vim.g.harpoon_current_line = line_pos
        else
          vim.g.harpoon_current_index = nil
          vim.g.harpoon_current_line = nil
        end
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
        group = harpoon_augroup,
        callback = update_harpoon_markers
      })

      local orig_nav = ui.nav_file
      ui.nav_file = function(index)
        orig_nav(index)

        vim.schedule(function()
          local current_file = vim.fn.expand("%:p")
          local line_pos = line_positions[current_file]

          if line_pos then
            vim.api.nvim_win_set_cursor(0, { line_pos, 0 })
            vim.cmd("normal! zz")
          end
        end)
      end

      local orig_rm = mark.rm_file
      mark.rm_file = function(...)
        local current_file = vim.fn.expand("%:p")
        line_positions[current_file] = nil

        orig_rm(...)
        update_harpoon_markers()
      end

      local orig_clear = mark.clear_all
      mark.clear_all = function()
        line_positions = {}
        orig_clear()
        vim.fn.sign_unplace("HarpoonMarkerGroup")
        vim.notify("Toutes les marques Harpoon supprimées", vim.log.levels.INFO)
      end

      -- Keymaps
      local keymap = vim.keymap.set
      keymap("n", "<leader>a", add_file_with_line, { desc = "Harpoon: Marquer la ligne actuelle" })
      keymap("n", "<leader>cc", function() mark.clear_all() end, { desc = "Harpoon: Supprimer toutes les marques" })
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

      -- Fonction pour la statusline
      function _G.harpoon_status()
        if vim.g.harpoon_current_index then
          local line_info = ""
          if vim.g.harpoon_current_line then
            line_info = ":" .. vim.g.harpoon_current_line
          end
          return "⚓ " .. vim.g.harpoon_current_index .. line_info
        end
        return ""
      end
    end,
  },
}
