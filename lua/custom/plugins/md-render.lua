local pack = require 'custom.pack'

pack.add_many {
  { 'nvim-tree/nvim-web-devicons', version = '*' },
  { 'delphinus/budoux.lua', version = '*' },
}
pack.add('delphinus/md-render.nvim', { version = '*', load = true })

vim.keymap.set('n', '<leader>mp', '<Plug>(md-render-preview)', { desc = 'Markdown preview (toggle)' })
vim.keymap.set('n', '<leader>mt', '<Plug>(md-render-preview-tab)', { desc = 'Markdown preview in tab (toggle)' })
vim.keymap.set('n', '<leader>md', '<Plug>(md-render-demo)', { desc = 'Markdown render demo' })
