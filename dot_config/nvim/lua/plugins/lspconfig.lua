return {
  "neovim/nvim-lspconfig",

  opts = {

    servers = {
      dotls = {},
      clangd = {
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
      },
    },
  },
}
