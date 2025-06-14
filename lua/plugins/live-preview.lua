-- Live preview window for HTML, Markdown, and SVG
return {
	'brianhuster/live-preview.nvim',
	ft = {
		'html',
		'htm',
		'svg',
		'svgz',
		'markdown',
		'md',
	},
	config = function()
		require('livepreview.config').set({
			dynamic_root = false,
		})
		vim.keymap.set('n', '<leader>tp', function() vim.cmd('LivePreview start') end, { desc = '[P]review Live' })
	end,
}
