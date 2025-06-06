return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            keymaps = {
                -- prevent clashing with harpoon
                ["<C-h>"] = false,
                ["<C-j>"] = false,
                ["<C-k>"] = false,
                ["<C-l>"] = false,
            },
            view_options = {
                show_hidden = true,
            },
            win_options = {
                signcolumn = "auto:2",
            },
        })
    end,
}
