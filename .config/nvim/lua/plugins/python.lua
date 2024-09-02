return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "akinsho/toggleterm.nvim",
    },
    opts = {
      servers = {
        pyright = {
          keys = {
            { "<F12>", '<cmd>TermExec direction=float cmd="bpython -i %" name="go" <CR>', desc = "Go Run" },
          },
        },
      },
    },
  },
}
