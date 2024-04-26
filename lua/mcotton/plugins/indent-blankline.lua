return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        enabled = true,
        indent = { char = "┊" },
        scope = {
            enabled = false,
            show_start = false,
            highlight = { "Function", "Label" },
        }
    },
}
