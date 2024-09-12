return {
    {
        "neovim/nvim-lspconfig",
        opts = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            vim.list_extend(keys, {
                { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" }
            })
        end,
    },
}
