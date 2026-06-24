local pack = require 'custom.pack'

pack.add('chomosuke/typst-preview.nvim', { version = '1.*' })
require('typst-preview').setup {}
