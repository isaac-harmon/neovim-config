-- NOTE: Normal Hotkeys
local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Basic tweaks
map('J', "mzJ`z", 'Join lines')
map('<esc>', vim.cmd.noh, 'End search highlighting')

-- Visual mode relocation
map('J', ":m '>+1<CR>gv=gv", 'Move selection down', 'v')
map('K', ":m '<-2<CR>gv=gv", 'Move selection up', 'v')
map('<C-x>', "\"_d", 'Delete preserve buffer', { 'n', 'v' })
map('<C-p>', "\"_dP", 'Paste preserve buffer', 'v')

-- Navigation
map('H', function()
	if vim.fn.expand('%') ~= 'OUTLINE_1' then
		vim.cmd('bprev')
	end
end, 'Move to previous buffer')
map('L', function()
	if vim.fn.expand('%') ~= 'OUTLINE_1' then
		vim.cmd('bnext')
	end
end, 'Move to previous buffer')

map('<C-h>', '<C-w><C-h>', 'Move focus to left window')
map('<C-l>', '<C-w><C-l>', 'Move focus to right window')
map('<C-j>', '<C-w><C-j>', 'Move focus to lower window')
map('<C-k>', '<C-w><C-k>', 'Move focus to upper window')

-- NOTE: Leader Menu Hotkeys

-- Tabs, Buffers, and Windows
map('<leader>wh', vim.cmd.split, 'Split [H]orizontal')
map('<leader>wv', vim.cmd.vsplit, 'Split [V]ertical')
map('<leader>ww', vim.cmd.close, 'Close [W]indow')
map('<leader>wb', vim.cmd.bdelete, 'Close [B]uffer')

-- Tools
map('<leader>tq', function ()
	if vim.iter(vim.fn.getwininfo()):any(function(wininf) return wininf.quickfix == 1 end)
	then vim.cmd('cclose')
	else vim.cmd('copen') end
end, '[Q]uick Fix')
