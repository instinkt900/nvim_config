return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
      require("conform").setup({
          formatters_by_ft = {
              typescript = { "prettier" },
              javascript = { "prettier" },
              json = { "prettier" }
          }
      })
  end
}

