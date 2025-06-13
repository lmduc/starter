return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua", -- must have copilot.lua setup and working
    "nvim-lua/plenary.nvim",
  },
  opts = {},
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
