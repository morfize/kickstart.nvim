return {
  'zbirenbaum/copilot.lua',
  enabled = true,
  event = 'InsertEnter',
  requires = {
    'copilotlsp/copilot-lsp.nvim',
  },
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
        layout = {
          position = 'right', -- | top | left | right | bottom |
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 100,
        trigger_on_accept = false,
        keymap = {
          accept = '<M-l>',
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = true,
        gitrebase = true,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      nes = {
        enabled = false, -- requires copilot-lsp as a dependency
        auto_trigger = false,
        keymap = {
          accept_and_goto = false,
          accept = false,
          dismiss = false,
        },
      },
      auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
      logger = {
        file = vim.fn.stdpath 'log' .. '/copilot-lua.log',
        file_log_level = vim.log.levels.OFF,
        print_log_level = vim.log.levels.WARN,
        trace_lsp = 'off', -- "off" | "messages" | "verbose"
        trace_lsp_progress = false,
        log_lsp_messages = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 20
      workspace_folders = {},
      copilot_model = '',
      root_dir = function()
        return vim.fs.dirname(vim.fs.find('.git', { upward = true })[1])
      end,
      should_attach = function(_, _)
        local logger = require 'copilot.logger'
        if not vim.bo.buflisted then
          logger.debug "not attaching, buffer is not 'buflisted'"
          return false
        end

        if vim.bo.buftype ~= '' then
          logger.debug("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
          return false
        end

        return true
      end,
      server = {
        type = 'nodejs', -- "nodejs" | "binary"
        custom_server_filepath = nil,
      },
      server_opts_overrides = {},
    }
    -- CopilotChat.nvim
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

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
  end,
}
