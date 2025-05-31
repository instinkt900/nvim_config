return {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup({
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
            highlight_groups = {
                CursorLine = { bg = "overlay" },
                IblWhitespace = { fg = "foam" },
                IblScope = { fg = "foam" },
                IblIndent = { fg = "highlight_high" },
                NormalFloat = { bg = "none" },
            }
        })
        vim.cmd('colorscheme rose-pine')
    end
}
