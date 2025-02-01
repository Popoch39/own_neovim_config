return {
  {
    "j-morano/buffer_manager.nvim"
  },
  {
    "nvim-lua/plenary.nvim",
    config = function()
      local manager = require("buffer_manager.ui");
      vim.keymap.set("n", "<leader>bm", manager.toggle_quick_menu, {})
      vim.keymap.set("n", "<leader>bb", "<cmd>b#<CR>", { noremap = true, silent = true })
    end
  }
}
