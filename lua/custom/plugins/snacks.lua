return {
  'folke/snacks.nvim',
  -- enabled = false,
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    image = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },

    notifier = {
      enabled = true,
      timeout = 3000, -- default timeout in ms
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      -- editor margin to keep free. tabline and statusline are taken into account automatically
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
      gap = 0, -- gap between notifications
      sort = { 'level', 'added' }, -- sort by level and time
      -- minimum log level to display. trace is the lowest
      -- all notifications are stored in history
      level = vim.log.levels.trace,
      icons = {
        error = ' ',
        warn = ' ',
        info = ' ',
        debug = ' ',
        trace = ' ',
      },
      keep = function(notif)
        return vim.fn.getcmdpos() > 0
      end,
      style = 'compact',
      top_down = false, -- place notifications from top to bottom
      date_format = '%R', -- time format for notifications
      -- format for footer when more lines are available
      -- `%d` is replaced with the number of lines.
      -- only works for styles with a border
      ---@type string|boolean
      more_format = ' ↓ %d lines ',
      refresh = 50, -- refresh at most every 50ms
    },

    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
