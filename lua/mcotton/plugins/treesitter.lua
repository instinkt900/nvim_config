return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        -- when this draws virtual text scrolling performance drops
        -- probably not a big deal because we shouldn't be scrolling honestly.
        require('treesitter-context').setup({
            enable = true,
            max_lines = 1,
            trim_scope = "outer"
        })

        require('nvim-treesitter').setup()

        -- Install missing parsers (no-op for parsers that are already installed).
        require('nvim-treesitter').install({
            "javascript",
            "typescript",
            "c",
            "cpp",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "json",
        })

        -- Highlighting is no longer enabled by nvim-treesitter; use Neovim's API.
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end
}
