-- Collection of utility, QoL, and UI plugins

local winheight = 0.97 -- Floating window height
local winwidth = 0.99 -- Floating window width

local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	config = true,
	keys = {
		-- Window Controls
		{ '<leader>wa', function() Snacks.bufdelete.all() end, desc = 'Close [A]ll' },
		{ '<leader>wo', function() Snacks.bufdelete.other() end, desc = 'Close [O]thers' },
		{ '<leader>wm', function() Snacks.zen.zen() end, desc = '[M]aximize Window' },

		-- File Search
		{ '<leader>ff', function() Snacks.picker.files() end, desc = '[F]ind (cwd)' },
		{ '<leader>fF', function() Snacks.picker.files({ cwd = '~' }) end, desc = '[F]ind (root)' },
		{ '<leader>ft', function() Snacks.picker.explorer({ layout = 'right' }) end, desc = '[T]ree (cwd)' },
		{ '<leader>fT', function() Snacks.picker.explorer({ cwd = '~' , layout = 'right' }) end, desc = '[T]ree (root)' },
		{ '<leader>fr', function() Snacks.picker.recent() end, desc = '[R]ecent' },
		{ '<leader>fp', function() Snacks.picker.projects() end, desc = '[P]rojects' },
		{ '<leader>fc', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config')}) end, desc = '[C]onfig' },
		{ '<leader>fR', function() Snacks.rename.rename_file() end, desc = '[R]ename' },

		-- File Grep
		{ '<leader>fg', function() Snacks.picker.grep() end, desc = '[G]rep (cwd)' },
		{ '<leader>fG', function() Snacks.picker.grep({ cwd = '~' }) end, desc = '[G]rep (root)' },
		{ '<leader>fs', function() Snacks.picker.grep_word() end, desc = '[G]rep Selection (cwd)' },
		{ '<leader>fS', function() Snacks.picker.grep_word({ cwd = '~' }) end, desc = '[G]rep Selection (root)' },

		-- Vim
		{ '<leader>va', function() Snacks.picker.autocmds({ layout = 'select' }) end, desc = '[C]ommands' },
		{ '<leader>vc', function() Snacks.picker.commands({ layout = 'select' }) end, desc = '[C]ommands' },
		{ '<leader>vC', function() Snacks.picker.command_history({ layout = 'select' }) end, desc = '[C]ommand History' },
		{ '<leader>vh', function() Snacks.picker.help() end, desc = '[H]elp Tags' },
		{ '<leader>vH', function() Snacks.picker.highlights() end, desc = '[H]ighlights' },
		{ '<leader>vk', function() Snacks.picker.keymaps({ layout = 'select' }) end, desc = '[K]eymaps' },
		{ '<leader>vm', function() Snacks.picker.marks() end, desc = '[M]arks' },
		{ '<leader>vn', function() Snacks.notifier.show_history() end, desc = '[N]otifications' },
		{ '<leader>vr', function() Snacks.picker.registers() end, desc = '[R]egisters' },

		-- Misc. Search
		{ '<leader>sb', function() Snacks.picker.buffers() end, desc = '[B]uffers' },
		{ '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = '[B]uffer Grep' },
		{ '<leader>si', function() Snacks.picker.icons({ layout = 'select' }) end, desc = '[I]cons' },
		{ '<leader>sm', function() Snacks.picker.man() end, desc = '[M]an Pages' },
		{ '<leader>sn', function() Snacks.picker.notifications() end, desc = '[N]otifications' },
		{ '<leader>sq', function() Snacks.picker.qflist() end, desc = '[Q]uick Fix' },

		-- Tools
		{ '<leader>tt', function() Snacks.terminal.toggle() end, desc = '[T]erminal' },
	},
	init = function()
		-- Default Stuff
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("wrap", { name = "[L]ine Break" }):map("<leader>ol")
				Snacks.toggle.option("list", { name = "[W]hitespace Guides" }):map("<leader>ow")

				Snacks.toggle.new({
					id = "scroll_off",
					name = "[C]entered Cursor",
					get = function()
						return vim.o.scrolloff ~= 10
					end,
					set = function(state)
						if state then
							vim.cmd('set scrolloff=99')
							vim.api.nvim_feedkeys('zz', 'n', true)
						else
							vim.cmd('set scrolloff=10')
						end
					end,
				}):map("<leader>oc")

				Snacks.toggle.new({
					id = 'indentguides',
					name = '[I]ndent Guides',
					get = function() return Snacks.indent.enabled end,
					set = function (state)
						if state then
							Snacks.indent.enable()
						else
							Snacks.indent.disable()
						end
					end,
				}):map("<leader>oi")
			end,
		})

		-- LSP Keybinds
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('snacks-lsp-attach', { clear = true }),
			callback = function ()
				map('<leader>cd', function() Snacks.picker.lsp_definitions() end, '[D]efinition')
				map('<leader>cD', function() Snacks.picker.lsp_declarations() end, '[D]eclaration')
				map('<leader>cr', function() Snacks.picker.lsp_references() end, '[R]eferences')
				map('<leader>ci', function() Snacks.picker.lsp_implementations() end, '[I]mplementations')
				map('<leader>ct', function() Snacks.picker.lsp_type_definitions() end, '[T]ype Definition')
				map('<leader>cs', function() Snacks.picker.lsp_symbols() end, '[S]ymbols (File)')
				map('<leader>cS', function() Snacks.picker.lsp_workspace_symbols() end, '[S]ymbols (All)')

				-- Snacks Debug
				map('<leader>sd', function() Snacks.picker.diagnostics_buffer() end, '[D]iagnostics (File)')
				map('<leader>sD', function() Snacks.picker.diagnostics() end, '[D]iagnostics (All)')

				-- LSP Option Toggles
				Snacks.toggle.new({
					id = 'focus',
					name = '[D]im Beyond Scope',
					get = function() return Snacks.dim.enabled end,
					set = function (state)
						if state then
							Snacks.dim.enable()
						else
							Snacks.dim.disable()
						end
					end,
				}):map("<leader>od")

				Snacks.toggle.new({
					id = "inline_hints",
					name = "[I]nline Hints",
					get = vim.lsp.inlay_hint.is_enabled,
					set = function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end,
				})
				:map("<leader>oI")
			end
		})
	end,
	opts = {
		quickfile = { enabled = true },
		bufdelete = { enabled = true },
		rename = { enabled = true },
		git = { enabled = true },
		lazygit = { enabled = true },
		notify = { enabled = true },
		terminal = { enabled = true },

		toggle = { notify = false },
		notifier = {
			timeout = 5000,
			width = { min = 1, max = 0.4},
			height = { min = 1, max = 0.6},
		},
		zen = {
			toggles = {
				dim = false,
				git_signs = true,
				diagnostics = true,
				inlay_hints = false,
			},
		},
		dim = {
			enabled = true,
			animate = { enabled = false },
		},
		indent = {
			enabled = false,
			animate = { enabled = false },
		},
		styles = {
			blame_line = {
				width = winwidth,
				height = winheight,
			},
			lazygit = {
				width = winwidth,
				height = winheight,
				border = 'none',
			},
			notification_history = {
				width = winwidth,
				height = winheight,
			},
			terminal = {
				border = 'rounded',
			},
			zen = {
				width = winwidth,
				height = winheight,
				border = "rounded",
			},
		},
		picker = {
			layout = {
				cycle = true,
				preset = 'default'
			},
			layouts = {
				default = {
					layout = {
						width = winwidth,
						height = winheight,
					},
				},
				select = {
					layout = {
						width = winwidth,
						height = winheight,
					},
				},
				sidebar = {
					preview = false;
					layout = {
						backdrop = false,
						width = 40,
						min_width = 40,
						height = 0,
						position = "left",
						border = "none",
						box = "vertical",
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
						{ win = "list", border = "none" },
						{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
					},
				}
			},
		},
		dashboard = {
			width = math.min(100, vim.o.columns - 10 or 25),
			preset = {
				header = [[
                                           d8,             
                                           `8P             
                                                           
  88bd88b    d8888b   d8888b   ?88   d8P  88b  88bd8b,d88b 
  88P' ?8b  d8bo,dP  d8P' ?88  d88  d8P'  88P  88P'`?8P'?8b
 d88   88P  88b      88b  d88  ?8b ,88'  d88  d88  d88  88P
d88'   88b  `?888P'  `?8888P'  `?888P'  d88' d88' d88'  88b]],
				keys = {
					{ icon = " ", key = "q", desc = "[Q]uit", action = ":qa" },
					{ icon = " ", key = "p", desc = "[P]rojects", action = function() Snacks.picker.projects() end },
					{ icon = " ", key = "e", desc = "[E]xplore Files", action = '<CMD>Yazi<CR>'},
					{ icon = " ", key = "f", desc = "[F]ind Files", action = function() Snacks.picker.files() end },
					{ icon = " ", key = "r", desc = "[R]ecent Files", action = function() Snacks.picker.recent() end },
					{ icon = " ", key = "c", desc = "[C]onfig Files", action = function() Snacks.picker.files({ cwd = vim.fn.stdpath('config')}) end },
					{ icon = " ", key = "g", desc = "[G]it", action = function() require('snacks').lazygit.open() end },
					{ icon = "󰒲 ", key = "l", desc = "[L]azy", action = ":Lazy" },
					{ icon = " ", key = "m", desc = "[M]ason", action = ":Mason" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "startup", padding = 1 },
				{
					section = "keys",
					padding = 1,
					indent = 0
				},
				{
					icon = " ",
					title = "Recent Projects",
					section = "projects",
					limit = 5,
					indent = 0,
					padding = 1,
				},
				{
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					limit = 5,
					indent = 0,
					padding = 1,
				},
			}
		},
	},
}
