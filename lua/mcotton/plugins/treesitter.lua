return {
    'nvim-treesitter/nvim-treesitter',
    -- event = { "BufReadPre", "BufNewFile" },
    -- build = ':TSUpdate',
    config = function()
        -- when this draws virtual text scrolling performance drops
        -- probably not a big deal because we shouldn't be scrolling honestly.
        require('treesitter-context').setup({
            enable = true,
            max_lines = 1,
            trim_scope = "outer"
        })

        local treesitter = require('nvim-treesitter.configs')
        treesitter.setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {
                "javascript",
                "typescript",
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "json"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = false,
            },
        })
    end
}
