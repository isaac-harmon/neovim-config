-- UI tweak for CMDline, notifications, and popupmenu
local function simKeys(keys, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), mode, true)
end
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function ()
		require('noice').setup({
			presets = {
				long_message_to_split = true,
			},
		})
	end,
}
