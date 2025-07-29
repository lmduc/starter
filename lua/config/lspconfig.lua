return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").gopls.setup({
      settings = {
        gopls = {
          usePlaceholders = true,
          completeUnimported = true,
        },
      },
    })
    require("lspconfig").metals.setup({})
  end,
}
