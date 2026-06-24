local pack = require 'custom.pack'

pack.add_many {
  'nvim-lua/plenary.nvim',
  'neovim/nvim-lspconfig',
  'pmizio/typescript-tools.nvim',
}

require('typescript-tools').setup {}
