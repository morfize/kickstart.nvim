local pack = require 'custom.pack'

vim.g.typst_pdf_viewer = 'skim'
pack.add('kaarmu/typst.vim', { load = true })
