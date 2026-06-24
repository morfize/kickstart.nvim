local pack = require 'custom.pack'

pack.add_many {
  'folke/snacks.nvim',
  '2kabhishek/nerdy.nvim',
}

require('nerdy').setup {
  max_recents = 30, -- Configure recent icons limit
  add_default_keybindings = true, -- Add default keybindings
  copy_to_clipboard = false, -- Copy glyph to clipboard instead of inserting
  copy_register = '+', -- Register to use for copying (if `copy_to_clipboard` is true)
}
