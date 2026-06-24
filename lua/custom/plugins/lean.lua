local pack = require 'custom.pack'

pack.add_many {
  'neovim/nvim-lspconfig',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'andymass/vim-matchup',
  'andrewradev/switch.vim',
  'tomtom/tcomment_vim',
  'Julian/lean.nvim',
}

---@type lean.Config
vim.g.lean_config = {
  mappings = true,
}
