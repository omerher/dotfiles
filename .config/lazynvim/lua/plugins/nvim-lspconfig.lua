return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  enabled = true,
                  maxLineLength = 100,
                  ignore = {},
                },
              },
            },
          },
        },
      },
    },
  },
}
