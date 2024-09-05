return {
	{
		"FooSoft/vim-argwrap",
		config = function()
			vim.g.argwrap_tail_comma = 1
		end,
		keys = {
			{ "<localleader>a", "<cmd>ArgWrap<cr>", desc = "ArgWrap" },
		},
	},
}
