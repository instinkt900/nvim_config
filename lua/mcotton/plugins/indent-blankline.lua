return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        enabled = true,
        indent = {
            char = "┊"
        },
        scope = {
            enabled = true,
            show_start = false,
            -- highlight = { "Function", "Label", "String" },
        }
    },
}
