return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.biome.with({
						"check",
						"--write",
						"--unsafe",
						"--formatter-enabled=true",
						"--organize-imports-enabled=true",
						"--stdin-file-path=$FILENAME",
					}),
				},
			})

			vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
		end,
	},
}
