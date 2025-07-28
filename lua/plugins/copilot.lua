-- NOTE: In order to install and run it properly, follow those steps:
-- - Make sure node version is 20+
-- - :Copilot install
-- - :Copilot auth
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false,
      keymap = {
        accept = "<Tab>",
        next = "<C-]>",
        prev = "<C-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
