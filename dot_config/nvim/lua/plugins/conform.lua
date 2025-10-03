return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      htmldjango = { "djlint" },
      dart = { "dart_format" },
      markdown = { "prettier" },
    },
    formatters = { ["prettier"] = { prepend_args = { "--print-width", "80", "--prose-wrap", "always" } } },
  },
}
