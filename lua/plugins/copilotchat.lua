return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {
    prompts = {
      Rename = {
        prompt = "Please rename the variable correcttly in given selection based on context",
        selection = function(source)
          local select = require("CopilotChat.select")
          return select.visual(source)
        end,
      },
    },
  },
  keys = {
    {
      "<leader>cc",
      function()
        require("CopilotChat").toggle()
      end,
      desc = "Toggle Copilot Chat",
    },
  },
}
