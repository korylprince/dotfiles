return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                ['*'] = {
                    keys = {
                        { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
                    },
                },
            },
        },
    },
}
