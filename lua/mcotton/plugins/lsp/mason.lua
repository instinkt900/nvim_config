return {
    'williamboman/mason.nvim',
    dependencies = {
        { 'williamboman/mason-lspconfig.nvim' },
        { 'neovim/nvim-lspconfig' },
    },
    config = function()
        require('mason').setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- clangd is managed by the system, not mason
        require('lspconfig').clangd.setup({})

        require('mason-lspconfig').setup({
            ensure_installed = {
                'ts_ls',
                'eslint',
                'lua_ls',
                'rust_analyzer',
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
                ts_ls = function()
                    require('lspconfig').ts_ls.setup({
                        -- settings = {
                        --     completions = {
                        --         completeFunctionCalls = true
                        --     }
                        -- }
                    })
                end,
                lua_ls = function()
                    require('lspconfig').lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }
                                }
                            }
                        }
                    }
                end,
            },
        })
    end
}

