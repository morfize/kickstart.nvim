return {
  'ravsii/tree-sitter-d2',
  lazy = 'VeryLazy',
  enable = true,
  ft = { 'd2', 'md' },
  version = '*',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  build = 'make nvim-install',
}
