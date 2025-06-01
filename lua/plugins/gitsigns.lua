-- Status Bar git icons
return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	config = function ()
		require('gitsigns').setup {
			signs = {
				add          = { text = '+' },
				change       = { text = '~' },
				delete       = { text = 'v' },
				topdelete    = { text = '^' },
				changedelete = { text = '-' },
				untracked    = { text = '┆' },
			},
			signs_staged = {
				add          = { text = '┃' },
				change       = { text = '┃' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '_' },
				untracked    = { text = '┆' },
			},
			signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
			numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'overlay', -- 'eol' | 'overlay' | 'right_align'
				delay = 50,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
			on_attach = function(bufnr)
				local gitsigns = require('gitsigns')
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then
						vim.cmd.normal({']c', bang = true})
					else
						gitsigns.nav_hunk('next')
					end
				end)

				map('n', '[c', function()
					if vim.wo.diff then
						vim.cmd.normal({'[c', bang = true})
					else
						gitsigns.nav_hunk('prev')
					end
				end)

				-- Staging
				map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage Buffer' } )
				map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset Buffer' } )

				map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[S]tage Hunk' } )
				map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[R]eset Hunk' } )

				map('v', '<leader>gs', function()
					gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
				end, { desc = '[S]tage Hunk' } )

				map('v', '<leader>gr', function()
					gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
				end, { desc = '[R]eset Hunk' } )

				-- Git Diff
				map('n', '<leader>gd', gitsigns.preview_hunk_inline, { desc = '[D]iff Hunk' } )
				map('n', '<leader>gD', gitsigns.diffthis, { desc = '[D]iff File' } )

				-- Quick Fix
				map('n', '<leader>gq', gitsigns.setqflist, { desc = '[Q]uick Fix Changes (File)' } )
				map('n', '<leader>gQ', function() gitsigns.setqflist('all') end, { desc = '[Q]uick Fix Changes (All)' } )

				-- HACK: RELOCATE BEFORE DELETING FILE! Snacks Commands Here

				-- Actions
				map('n', "<leader>gg", function() Snacks.lazygit.open() end, { desc = "[G]it" })
				map('n', "<leader>gb", function() Snacks.git.blame_line() end, { desc = "[B]lame Line" })
				map('n', "<leader>gl", function() Snacks.lazygit.log_file() end, { desc = "[L]og (File)" })
				map('n', "<leader>gL", function() Snacks.lazygit.log() end, { desc = "[L]og (All)" })

				-- Searching
				map('n', "<leader>sgb", function() Snacks.picker.git_branches() end, { desc = "[B]ranches" })
				map('n', "<leader>sgl", function() Snacks.picker.git_log_file() end, { desc = "[L]og (File)" })
				map('n', "<leader>sgL", function() Snacks.picker.git_log() end, { desc = "[L]og (All)" })
				map('n', "<leader>sgs", function() Snacks.picker.git_status() end, { desc = "[S]tatus" })
				map('n', "<leader>sgS", function() Snacks.picker.git_stash() end, { desc = "[S]tash" })
				map('n', "<leader>sgd", function() Snacks.picker.git_diff() end, { desc = "[D]iff (Hunks)" })
			end
		}
	end
}
