local pack = require 'custom.pack'

pack.add_many {
  'folke/snacks.nvim',
  'coder/claudecode.nvim',
}

require('claudecode').setup {
  -- Server Configuration
  port_range = { min = 10000, max = 65535 },
  auto_start = true,
  log_level = 'info', -- "trace", "debug", "info", "warn", "error"
  terminal_cmd = nil, -- Custom terminal command (default: "claude")
  -- For local installations: "~/.claude/local/claude"
  -- For native binary: use output from 'which claude'

  -- Send/Focus Behavior
  -- When true, successful sends will focus the Claude terminal if already connected
  focus_after_send = false,

  -- Selection Tracking
  track_selection = true,
  visual_demotion_delay_ms = 50,

  -- Terminal Configuration
  terminal = {
    split_side = 'right', -- "left" or "right"
    split_width_percentage = 0.30,
    provider = 'auto', -- "auto", "snacks", "native", "external", "none", or custom provider table
    auto_close = true,
    snacks_win_opts = {}, -- Opts to pass to `Snacks.terminal.open()` - see Floating Window section below

    -- Provider-specific options
    provider_opts = {
      -- Command for external terminal provider. Can be:
      -- 1. String with %s placeholder: "alacritty -e %s" (backward compatible)
      -- 2. String with two %s placeholders: "alacritty --working-directory %s -e %s" (cwd, command)
      -- 3. Function returning command: function(cmd, env) return "alacritty -e " .. cmd end
      external_terminal_cmd = nil,
    },
  },

  -- Diff Integration
  diff_opts = {
    auto_close_on_accept = true,
    vertical_split = true,
    open_in_current_tab = true,
    keep_terminal_focus = false, -- If true, moves focus back to terminal after diff opens
  },
}

pcall(function()
  require('which-key').add { { '<leader>a', group = 'AI/Claude Code' } }
end)

vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>', { desc = 'Toggle Claude' })
vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Focus Claude' })
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>', { desc = 'Resume Claude' })
vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>', { desc = 'Continue Claude' })
vim.keymap.set('n', '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', { desc = 'Select Claude model' })
vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = 'Add current buffer' })
vim.keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = 'Send to Claude' })
vim.keymap.set('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', { desc = 'Accept diff' })
vim.keymap.set('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', { desc = 'Deny diff' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
  callback = function(ev)
    vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', { buffer = ev.buf, desc = 'Add file' })
  end,
})
