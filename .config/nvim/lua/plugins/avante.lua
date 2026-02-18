return {
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    opts = {
      instructions_file = "avante.md",
      provider = "cliproxy",
      providers = {
        routerai = {
          __inherited_from = "openai",
          endpoint = "https://routerai.ru/api/v1/",
          model = "anthropic/claude-sonnet-4.6", -- Модель по умолчанию
          disabled_tools = { "python" }, -- Здесь можно указать какие инструменты Avante не будет использовать
          model_names = { -- Список моделей доступных для выбора
            "x-ai/grok-code-fast-1",
            "x-ai/grok-4.1-fast",
            "qwen/qwen3-coder-plus",
            "anthropic/claude-sonnet-4.6",
            "anthropic/claude-haiku-4.5",
          },
          api_key_name = 'ROUTERAI_API_KEY',
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 16000
          },
          extra_headers = {
            ["HTTP-Referer"] = "https://github.com/yetone/avante.nvim",
            ["X-Title"] = "Avante.nvim"
          }
        },
        cliproxy = {
          __inherited_from = "openai",
          endpoint = "https://vibecoding.bot.nu/v1",
          model = "anthropic/claude-sonnet-4.6", -- Модель по умолчанию
          disabled_tools = { "python" }, -- Здесь можно указать какие инструменты Avante не будет использовать
          model_names = { -- Список моделей доступных для выбора
            "anthropic/claude-sonnet-4.6",
            "anthropic/claude-opus-4.6",
            "anthropic/claude-haiku-4.5",
          },
          api_key_name = 'CLIPROXY_API_KEY',
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75
          }
        },
      },
      behaviour = {
        auto_approve_tool_permissions = false
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
