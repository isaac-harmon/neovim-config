-- Dynamic markdown previews
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	ft = {
		'md',
		'markdown',
	},
	config = function ()
		require('render-markdown').setup({
			completions = { blink = { enabled = true } },
			quote = { repeat_linebreak = true },
			checkbox = { checked = { scope_highlight = '@markup.strikethrough' } },
			code = {
				position = 'right',
				width = 'block',
				right_pad = 4,
			},
			heading = {
				position = 'inline',
				backgrounds = {
					'RenderMarkdownH4Bg',
					'RenderMarkdownH3Bg',
					'RenderMarkdownH1Bg',
					'RenderMarkdownH2Bg',
					'RenderMarkdownH5Bg',
					'RenderMarkdownH6Bg',
				},
			},
			indent = { enabled = true },
		})

		-- Color corrections
		vim.cmd('hi RenderMarkdownH5Bg guifg=#00a3cc')
		vim.cmd('hi RenderMarkdownH5Bg guibg=#1b1c36')
		vim.cmd('hi RenderMarkdownH6Bg guibg=#1b1c36')
	end,
}
