return {
  --TODO: test todo
  --FIX: this need fixing
  --NOTE: thats a note
  --PERF: this is a performance improvement
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        TODO = { icon = "󰙴", color = "info" },
      },
      gui_style = {
        fg = "BOLD",
        bg = "BOLD",
      },

    }
  }
}
