local pack = require 'custom.pack'

vim.g.d2_ascii_autorender = 0
vim.g.d2_ascii_command = 'd2'
vim.g.d2_ascii_preview_width = vim.o.columns / 2
vim.g.d2_ascii_mode = 'extended'
vim.g.d2_fmt_autosave = 1
vim.g.d2_fmt_command = 'd2 fmt'
vim.g.d2_fmt_fail_silently = 0
vim.g.d2_validate_autosave = 0
vim.g.d2_validate_command = 'd2 validate'
vim.g.d2_list_type = 'quickfix'
vim.g.d2_fail_silently = 0
vim.g.d2_play_command = 'd2 play'
vim.g.d2_play_theme = 0
vim.g.d2_play_sketch = 0

pack.add('terrastruct/d2-vim', { load = true })
