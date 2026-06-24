local pack = require 'custom.pack'

pack.add_many {
  'nvim-tree/nvim-web-devicons',
  { 'akinsho/bufferline.nvim', version = '*' },
}

require('bufferline').setup {}
