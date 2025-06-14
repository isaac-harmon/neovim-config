-- File Explorer
return {
	"mikavilpas/yazi.nvim",
	event = "VimEnter";
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{
			-- Open in the current working directory
			"<leader>fe",
			"<cmd>Yazi cwd<cr>",
			desc = "[E]xplorer (cwd)",
		},
		{
			"<leader>fE",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "[E]xplorer (at file)",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		floating_window_scaling_factor = 1,
		keymaps = {
			show_help = "<f1>",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
