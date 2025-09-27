return {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local C = require 'nordic.colors'
      require('nordic').setup {
        bright_border = true,
        telescope = {
          style = 'classic',
        },
        on_highlight = function(highlights, palette)
          highlights.WhichKeyBorder = { fg = C.white0, bg = C.gray1 }
          highlights.WhichKeyFloat = { bg = C.gray1 }
          highlights.Visual = { bg = "#3A515D", bold = true, }
          highlights.CmpDocumentation = { fg = C.white0, bg = C.gray1 }
          highlights.CmpDocumentationBorder = { fg = C.white0, bg = '#3A515D' }
          highlights.CmpGhostText = { fg = C.white0, bg = C.gray1 }
        end,
      }
    end
  }
}
