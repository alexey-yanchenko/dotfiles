return {
  { 
    "neovim/nvim-lspconfig",
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = function()
      local lspconfig = require("lspconfig")

      for name, icon in pairs(require("config.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      local diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●"
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("config.icons").diagnostics.Error,
            [vim.diagnostic.severity.WARN] = require("config.icons").diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = require("config.icons").diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = require("config.icons").diagnostics.Info,
          },
        },
      }
      vim.diagnostic.config(vim.deepcopy(diagnostics))

      lspconfig.solargraph.setup({
        cmd = { "docker", "compose", "exec", "web", "bundle", "exec", "solargraph" , "stdio" },
        filetypes = { "ruby" },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
        settings = {
          solargraph = {
            autoformat = true,
            completion = true,
            diagnostic = false,
            folding = true,
            references = true,
            rename = true,
            symbols = true
          }
        },
      })
      -- lspconfig.rubocop.setup({
      -- 	cmd = { "docker", "compose", "exec", "web", "bundle", "exec", "rubocop" , "--lsp" },
      --   filetypes = { "ruby" },
      --   root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
      -- })
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
      vim.keymap.set("n", "gd", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition" })
      vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", { desc = "References"})
      vim.keymap.set("n", "<leader>dd", "<Cmd>lua vim.diagnostic.disable()<cr>", { desc = "Disable LSP diagnostic"})
      vim.keymap.set("n", "<leader>de", "<Cmd>lua vim.diagnostic.enable()<cr>", { desc = "Enable LSP diagnostic"})
      -- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Goto Declaration"})
      vim.diagnostic.disable()
      vim.lsp.set_log_level("debug")
    end
  },
}
