return {
    { "nvimdev/dashboard-nvim", enabled = false },
    { "nvim-mini/mini.pairs", enabled = false },
    { "stevearc/conform.nvim", enabled = false },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = {
                enabled = false,
            },
        },
    },
    {
        "folke/snacks.nvim",
        opts = {
            dashboard = { enabled = false },
        },
    }
}
