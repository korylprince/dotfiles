-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- init settings before lazy.nvim is loaded
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.ignorecase = true
vim.opt.relativenumber = false

vim.opt.clipboard = ""
vim.opt.mouse = ""
vim.opt.scrolloff = 999

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.g.autoformat = false

require("lazy").setup({
    spec = {
        { "ellisonleao/gruvbox.nvim",
            config = function()
                vim.cmd.colorscheme("gruvbox")
            end
        },
    },
    install = { colorscheme = { "gruvbox" } },
    checker = { enabled = false },
})
