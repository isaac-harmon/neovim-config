-- Bottom status bar tweaks
return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function ()
		require('lualine').setup({
			options = {
				section_separators = { left = '' , right = '' },
				component_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						'mode',
						separator = { left = '', right = ''},
					},
				},
				lualine_b = {
					'filesize',
					{
						function() return ' ' end,
						padding = 0,
					},
					{
						'filetype',
						padding = 0,
						icon_only = true,
						colored = false,
					},
					{
						'filename',
						padding = { right = 1 },
						path = 4,
						symbols = {
							modified = '',
							readonly = ' ',
							unnamed = '',
							newfile = 'New File',
						},
					},
				},
				lualine_c = {'branch', 'diff'},
				lualine_x = {
					'searchcount',
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then return "" end -- not recording
							return "Recording [" .. reg .. "]"
						end
					},
					'diagnostics',
				},
				lualine_y = {
					{
						'lsp_status',
						separator = { left = '', right = '' },
					},
				},
				lualine_z = {},
			},
			tabline = {
				lualine_b = {
					{
						'buffers',
						separator = { left = '', right = '' },
						mode = 2,
						max_length = vim.o.columns * 4 / 5,
						buffers_color = {
							active = 'lualine_a_normal',
							inactive = 'lualine_b_normal',
						},
						symbols = {
							modified = ' ',
							alternate_file = '',
						},
					},
				},
				lualine_y = {
					{
						'tabs',
						separator = { left = '', right = '' },
						tabs_color = {
							active = 'lualine_a_normal',
							inactive = 'lualine_b_normal',
						},
						show_modified_status = false,
						max_length = vim.o.columns * 1 / 8,
					},
				},
			},
		})
		vim.opt.cmdheight = 0
		vim.cmd('hi TabLineFill guibg=#0f111b')
	end
}
