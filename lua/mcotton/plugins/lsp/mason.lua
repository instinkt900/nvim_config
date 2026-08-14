return {
    'williamboman/mason.nvim',
    dependencies = {
        { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
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

        require('mason-tool-installer').setup({
            ensure_installed = {
                'eslint-lsp',
                'lua-language-server',
                'rust-analyzer',
                'typescript-language-server',
            },
        })

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        })

        -- clangd is managed by the system (nixos clang-tools), not mason.
        vim.lsp.enable('clangd')
        vim.lsp.enable('eslint')
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('rust_analyzer')
        vim.lsp.enable('ts_ls')
    end
}
