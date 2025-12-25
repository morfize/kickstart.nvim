return {
  'ravsii/tree-sitter-d2',
  enable = true,
  ft = { 'd2', 'md' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  build = 'make nvim-install',
}
