--vim.opt.guicursor = ""

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.formatoptions:remove("or")

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/nvim-data/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8;
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "110"

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        local textwidth = vim.bo.textwidth
        if textwidth > 0 then
            vim.wo.colorcolumn = tostring(textwidth)
        end
    end,
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     pattern = { "cpp", "c", "h", "hpp" },
--     callback = function()
--         vim.schedule(function()
--             require("lint").try_lint()
--         end)
--     end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
--     callback = function()
--         require("lint").try_lint()
--     end,
-- })
