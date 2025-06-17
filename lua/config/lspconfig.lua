return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").gopls.setup({})
    require("lspconfig").metals.setup({})
  end,
}
