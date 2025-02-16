return {
  "nvim-pack/nvim-spectre",
  config = function()
    vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre"
    })
  end
}
