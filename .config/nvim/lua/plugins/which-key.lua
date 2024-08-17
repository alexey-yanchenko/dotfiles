 -- Displays a popup with possible key bindings of the command you started typing
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
			win = {
				border = { '', '▔', '', '', '', ' ', '', '' },
				padding = { 2, 2, 2, 2 },
			},
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add(
         {
           mode = { "n", "v" },
           { "<leader><tab>", group = "tabs" },
           { "<leader>c", group = "code" },
           { "<leader>d", group = "LSP" },
           { "<leader>g", group = "GIT" },
           { "<leader>f", group = "file/find" },
           { "<leader>q", group = "quit/session" },
           { "<leader>s", group = "search" },
           { "<leader>u", group = "ui" },
           { "<leader>w", group = "windows" },
           { "[", group = "prev" },
           { "]", group = "next" },
           { "g", group = "goto" },
           { "gs", group = "surround" },
         }
       )
    end,
  },
}
