-- TODO tag highlighting
return {
	'folke/todo-comments.nvim',
	event = 'VeryLazy',
	--dependencies = { 'nvim-lua/plenary.nvim', },
	opts = {
		signs = true,

		keywords = {
			TODO = {},
			NOTE = { alt = { 'INFO' }},
			FIX = { alt = { 'BUG' }},
			WARN = {},
			HACK = {},
			PERF = { alt = { 'OPTIMIZE' }},
			TEST = { alt = { 'PASSED', 'FAILED' }},
		},
	},
	config = function ()
		require('todo-comments').setup()
		vim.keymap.set('n', "<leader>td", function() 
			Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "BUG", "HACK", "OPTIMIZE", "TEST", "FAILED" } })
		end, { desc = "To-[D]o Comments" })
	end
}
-- Tags appear as follows
-- TODO: Finish This
-- NOTE: Blah blah blah
-- FIX:  Needs serious work
-- WARN: Very unstable
-- HACK: Somehow this works
-- PERF: Optimized, don't touch
-- TEST: Subject to change
