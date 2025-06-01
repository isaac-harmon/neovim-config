-- File Overview
return {
	"hedyhli/outline.nvim",
	event = 'LspAttach',
	cmd = { "Outline", "OutlineOpen" },
	config = function ()
		require('outline').setup({
			outline_window = {
				hide_cursor = true,
				auto_jump = true,
				auto_close = true,
			},
			outline_items = {
				show_symbol_lineno = true,
			}
		})
		vim.keymap.set('n', "<leader>to", ":Outline<CR>", { desc = "[O]utline" })
	end
}
