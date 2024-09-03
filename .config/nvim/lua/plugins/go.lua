return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				-- disable go.nvim inlay hints since they're provided by lsp
				lsp_inlay_hints = {
					enable = false,
				},
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},

	{
		"korylprince/nvim-goc.lua",
		dependencies = {
			"ray-x/go.nvim",
		},
		config = function()
			local goc = require("nvim-goc")
			goc.setup()
			-- override theme for uncovered
			vim.api.nvim_set_hl(0, "GocUncovered", { link = "GruvboxRed" })

			-- define commands
			vim.api.nvim_create_user_command("GoCoverage", function()
				pcall(goc.Coverage)
			end, { force = true })

			vim.api.nvim_create_user_command("GoCoverageFunc", function()
				pcall(goc.CoverageFunc)
			end, { force = true })

			vim.api.nvim_create_user_command("GoCoverageClear", function()
				pcall(goc.ClearCoverage)
			end, {})

			vim.api.nvim_create_user_command("GoCoverageBrowser", function()
				local cb = function(path)
					if path then
						vim.cmd(':silent exec "!open ' .. path .. '"')
					end
				end
				pcall(goc.Coverage, nil, cb)
			end, {})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		opts = {
			servers = {
				gopls = {
					keys = {
						{ "<F12>", '<cmd>TermExec direction=float cmd="go run ." name="go" <CR>', desc = "Go Run" },
					},
				},
			},
		},
	},
}
