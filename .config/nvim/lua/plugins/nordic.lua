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
				override = {
					WhichKeyBorder = { fg = C.white0, bg = C.gray1 },
					WhichKeyFloat = { bg = C.gray1 },
          Visual = { bg = "#3A515D", bold = true, },
          CmpDocumentation = { fg = C.white0, bg = C.gray1 },
          CmpDocumentationBorder = { fg = C.white0, bg = '#3A515D' },
          CmpGhostText = { fg = C.white0, bg = C.gray1 },
				}
			}
    end
  }
}
