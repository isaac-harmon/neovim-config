-- Autocompletion

local keys = {
	preset = 'none',

	['<Down>'] = {'select_next', 'fallback'},
	['<Up>'] = {'select_prev', 'fallback'},
	['<Tab>'] = { 'select_and_accept', 'fallback' },

	['<C-space>'] = { 'hide', 'fallback' },
	['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },

	['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
	['<C-p>'] = { 'scroll_documentation_up', 'fallback' },

	['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
}

return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	dependencies = { 'folke/lazydev.nvim' },
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = keys,
		completion = {
			list = { selection = { auto_insert = false, }, },
			menu = {
				border = 'rounded',
				draw = {
					treesitter = { 'lsp', 'path', 'lazydev'},
					columns = {
						{ "kind_icon", "label", gap = 1 },
						{ "kind" },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = 'rounded',
				},
			},
			ghost_text = { enabled = true },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono'
		},
		sources = {
			default = { 'lsp', 'path', 'lazydev'},
			providers = {
				lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
			},
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		signature = { enabled = true },
		cmdline = {
			keymap = keys,
			completion = {
				ghost_text = { enabled = true },
				menu = { auto_show = true, },
			},
		},
	},
}
