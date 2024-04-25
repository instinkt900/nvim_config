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

        require('mason-lspconfig').setup({
            ensure_installed = {
                'tsserver',
                'lua_ls',
                'rust_analyzer',
                'clangd'
            },
            handlers = {
                require('lsp-zero').default_setup,
                tsserver = function()
                    require('lspconfig').tsserver.setup({
                        settings = {
                            completions = {
                                completionFunctionCalls = true
                            }
                        }
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
                clangd = function()
                    require('lspconfig').clangd.setup {}
                end
            },
        })
    end
}

