return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            cpp = { 'clangtidy' },
            c = { 'clangtidy' },
        }
        local clangtidy = require('lint').linters.clangtidy
        local build_dir = '/home/mcotton/Development/moth/moth_ui/build/Debug'
        clangtidy.args = vim.fn.isdirectory(build_dir) == 1
            and { '--quiet', '-p', build_dir }
            or { '--quiet' }
    end
}
