-- Colorscheme
return {
	"pineapplegiant/spaceduck",
	config = function()
		-- General colorscheme
		vim.cmd('colo spaceduck')

		-- Text
		vim.cmd('hi string guifg=#7a55cc')

		-- UI
		vim.cmd('hi LineNr guifg=#30365f')
		vim.cmd('hi CursorLineNr guifg=#e39400')
		vim.cmd('hi normalFloat guibg=Whitespace')

		-- Icons
		vim.cmd('hi DiagnosticError guifg=#e03400')
		vim.cmd('hi ErrorMsg guifg=#e03400')

		vim.cmd('hi DiagnosticWarn guifg=#e39400')
		vim.cmd('hi WarningMsg guifg=#e39400')

		vim.cmd('hi DiagnosticInfo guifg=#7a55cc')
		vim.cmd('hi DiagnosticHint guifg=#5ccc96')
	end,
}
