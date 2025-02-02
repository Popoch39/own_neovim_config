return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
   	 dependencies = { 'nvim-lua/plenary.nvim' },
	  config = function()
		local telescope = require("telescope")
      local builtin = require("telescope.builtin")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules/.*" },
				}
			})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
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
