return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.init_options = metals_config.init_options or {}
    metals_config.init_options.statusBarProvider = "on" -- or "off" or "show-message" as you prefer

    metals_config.settings = {
      inlayHints = {
        implicitArguments = { enable = true },
        implicitConversions = { enable = true },
        -- You can enable other hints if desired
        inferredTypes = { enable = true },
        typeParameters = { enable = true },
        byNameParameters = { enable = true },
        hintsInPatternMatch = { enable = true },
      },
    }
    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })

    -- Optionally enable inlay hints globally (for all buffers)
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "*.scala", "*.sbt" },
      callback = function()
        -- Available in Neovim 0.10+ (use :h vim.lsp.inlay_hint for details)
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true)
        elseif vim.lsp.buf and vim.lsp.buf.inlay_hint then -- older API
          vim.lsp.buf.inlay_hint(0, true)
        end
      end,
      group = nvim_metals_group,
    })
  end,
}
