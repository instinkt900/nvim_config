return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            cpp = { 'clangtidy' },
            c = { 'clangtidy' },
        }
        local clangtidy = require('lint').linters.clangtidy
        clangtidy.args = {
            '--quiet',
            '-p', '/home/mcotton/Development/canyon/build/Debug'
        }
    end
}
