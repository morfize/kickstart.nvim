local pack = require 'custom.pack'

pack.add('sourcegraph/amp.nvim', { branch = 'main' })
require('amp').setup { auto_start = true, log_level = 'info' }
