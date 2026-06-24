local pack = require 'custom.pack'

pack.add 'toppair/peek.nvim'

require('peek').setup()
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
