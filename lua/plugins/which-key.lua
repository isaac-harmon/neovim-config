-- Keymap tooltip
return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function ()
		require('which-key').setup({
			preset = 'helix',
			sort = {'group', 'alphanum'},
			-- delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of vim.opt.timeoutlen
			delay = 50,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = false,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = '<Up> ',
					Down = '<Down> ',
					Left = '<Left> ',
					Right = '<Right> ',
					C = '<C-…> ',
					M = '<M-…> ',
					D = '<D-…> ',
					S = '<S-…> ',
					CR = '<CR> ',
					Esc = '<Esc> ',
					ScrollWheelDown = '<ScrollWheelDown> ',
					ScrollWheelUp = '<ScrollWheelUp> ',
					NL = '<NL> ',
					BS = '<BS> ',
					Space = '<Space> ',
					Tab = '<Tab> ',
					F1 = '<F1>',
					F2 = '<F2>',
					F3 = '<F3>',
					F4 = '<F4>',
					F5 = '<F5>',
					F6 = '<F6>',
					F7 = '<F7>',
					F8 = '<F8>',
					F9 = '<F9>',
					F10 = '<F10>',
					F11 = '<F11>',
					F12 = '<F12>',
				},
			},
		})
		require('which-key').add({
			-- Groups
			{ '<leader>c', group = '[C]ode' },
			{ '<leader>f', group = '[F]iles' },
			{ '<leader>g', group = '[G]it' },
			{ '<leader>n', group = '[N]otificatons' },
			{ '<leader>o', group = '[O]ptions' },
			{ '<leader>s', group = '[S]earch' },
			{ '<leader>t', group = '[T]ools' },
			{ '<leader>v', group = '[V]im' },
			{ '<leader>w', group = '[W]indow' },

			-- Subgroups
			{ '<leader>sg', group = '[G]it' },
		})
	end,
}

