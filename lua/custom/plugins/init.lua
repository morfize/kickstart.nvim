-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.cmd 'language en_GB.UTF-8'

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8' }

vim.opt.termguicolors = true

vim.opt.winblend = 0
vim.opt.pumblend = 0

vim.g.background = 'dark'

vim.opt.wrap = true

vim.diagnostic.config {
  update_in_insert = true,
  underline = false,
}

vim.cmd 'filetype plugin on'

-- NOTE: keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- basic function
map('n', ';', ':', { desc = '' })
-- buffer control
map('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<Leader>x', '<cmd>bdelete<CR>', { desc = 'delete buffer' })

-- telescope
map('n', '<Leader>tc', '<cmd>Telescope colorscheme<CR>', { desc = '[T]elescope [C]olorscheme' })

-- toggleterm
map('n', '<Leader>H', '<cmd>ToggleTerm size=16 direction=horizontal<CR>', { desc = 'Open Terminal Horizontal' })
-- map('t', '<Leader>H', '<cmd>ToggleTerm size=20 direction=horizontal<CR>', { desc = 'Open Terminal Horizontal' })
map('n', '<Leader>V', '<cmd>ToggleTerm size=80 direction=vertical<CR>', { desc = 'Open Terminal Vertical' })
-- map('t', '<Leader>V', '<cmd>ToggleTerm size=80 direction=vertical<CR>', { desc = 'Open Terminal Vertical' })
map('n', '<M-i>', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Open Terminal floating' })
map('t', '<M-i>', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Open Terminal floating' })

-- CopilotChat.nvim
map('n', '<Leader>cci', '<cmd>CopilotChat ', { desc = ':CopilotChat', unpack(opts) })
map('n', '<Leader>cco', '<cmd>CopilotChatOpen<CR>', { desc = ':CopilotChatOpen', unpack(opts) })
map('n', '<Leader>ccq', '<cmd>CopilotChatClose<CR>', { desc = ':CopilotChatClose', unpack(opts) })
map('n', '<Leader>cct', '<cmd>CopilotChatToggle<CR>', { desc = ':CopilotChatToggle', unpack(opts) })
map('n', '<Leader>ccs', '<cmd>CopilotChatStop<CR>', { desc = ':CopilotChatStop', unpack(opts) })
map('n', '<Leader>ccr', '<cmd>CopilotChatReset<CR>', { desc = ':CopilotChatReset', unpack(opts) })
map('n', '<leader>ccS', '<cmd>CopilotChatSave ', { desc = 'Save Copilot Chat history', noremap = true, silent = false })
map('n', '<leader>ccL', '<cmd>CopilotChatLoad ', { desc = 'Load Copilot Chat history', noremap = true, silent = false })
map('n', '<leader>ccp', '<cmd>CopilotChatPrompts<CR>', { desc = 'Copilot Chat prompt templates', unpack(opts) })
map('n', '<leader>ccm', '<cmd>CopilotChatModels<CR>', { desc = 'Copilot Chat models', unpack(opts) })
map('n', '<leader>ccE', '<cmd>CopilotChat', { desc = 'Copilot Chat prompt template', noremap = true, silent = false })

-- macos like keybindings for text editing in insert mode
map('i', '<C-a>', '<C-o>^', opts)
map('i', '<C-e>', '<C-o>$', opts)
map('i', '<C-k>', '<C-o>D', opts)
map('i', '<C-u>', '<C-o>d0', opts)
map('i', '<C-f>', '<Right>', opts)
map('i', '<C-b>', '<Left>', opts)
map('i', '<C-d>', '<Del>', opts)
map('i', '<C-h>', '<BS>', opts)
map('i', '<C-n>', '<Down>', opts)
map('i', '<C-p>', '<Up>', opts)
-- NOTE: keymaps end

-- NOTE: neovide
local function set_ime(args)
  if args.event:match 'Enter$' then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup('ime_input', { clear = true })

vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  group = ime_input,
  pattern = '*',
  callback = set_ime,
})

vim.api.nvim_create_autocmd({ 'CmdlineEnter', 'CmdlineLeave' }, {
  group = ime_input,
  pattern = '[/\\?]',
  callback = set_ime,
})

vim.g.neovide_cursor_animation_length = 0.1
-- NOTE: neovide end

return {}
