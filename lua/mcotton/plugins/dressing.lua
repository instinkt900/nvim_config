return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false }, -- similar to indent-blankline
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
    -- "stevearc/dressing.nvim",
    -- event = "VeryLazy",
    -- config = function()
    --     require('dressing').setup({
    --         input = {
    --             get_config = function()
    --                 if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
    --                     return { enabled = false }
    --                 end
    --             end,
    --         },
    --         select = {
    --             backend = { "telescope", "builtin" },
    --             get_config = function()
    --                 if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
    --                     return { enabled = false }
    --                 end
    --             end
    --         },
    --     })
    -- end,
}
