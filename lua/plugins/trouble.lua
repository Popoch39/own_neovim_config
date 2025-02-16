return {
  {
    "folke/trouble.nvim",
     opts = {
      position = "bottom", -- position de la fenêtre Trouble
      height = 10, -- hauteur de la fenêtre
      mode = "document_diagnostics", -- montre les diagnostics du document actuel par défaut
      fold_open = "", -- icône pour les sections ouvertes
      fold_closed = "", -- icône pour les sections fermées
      action_keys = { -- personnalisation des touches
        next = "j", -- aller au problème suivant
        previous = "k", -- aller au problème précédent
        close = "q", -- fermer la fenêtre
        jump = "<cr>", -- aller à l'emplacement du problème
        toggle_fold = "za", -- plier/déplier une section
      },
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
