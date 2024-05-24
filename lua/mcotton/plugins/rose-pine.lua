return {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup({
            highlight_groups = {
                CursorLine = { bg="overlay" },
                IblWhitespace = { fg = "foam" },
                IblScope = { fg = "foam" },
                IblIndent = { fg = "highlight_high" },
            }
        })
        vim.cmd('colorscheme rose-pine')
    end
}
