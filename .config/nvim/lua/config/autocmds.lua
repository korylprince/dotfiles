-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function(event)
		vim.keymap.set(
			"n",
			"<F12>",
			'<cmd>TermExec direction=float cmd="sh %" name="shell" <CR>',
			{ buffer = event.buf }
		)
	end,
})
