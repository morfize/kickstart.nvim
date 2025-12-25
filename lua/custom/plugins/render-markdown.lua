return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    checkbox = {
      enabled = true,
      render_modes = false,
      bullet = false,
      left_pad = 0,
      right_pad = 1,
      unchecked = {
        icon = '󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
        scope_highlight = nil,
      },
      checked = {
        icon = '󰱒 ',
        highlight = 'RenderMarkdownChecked',
        scope_highlight = nil,
      },
      custom = {
        doing = { raw = '[d]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
        pending = { raw = '[p]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
        asking = { raw = '[a]', rendered = '󱜺 ', highlight = 'RenderMarkDownTodo', scope_highlight = nil },
      },
      scope_priority = nil,
    },
  },
  html = {
    -- Turn on / off all HTML rendering.
    enabled = true,
    -- Additional modes to render HTML.
    render_modes = false,
    comment = {
      -- Turn on / off HTML comment concealing.
      conceal = false,
      -- Optional text to inline before the concealed comment.
      text = nil,
      -- Highlight for the inlined text.
      highlight = 'RenderMarkdownHtmlComment',
    },
    -- HTML tags whose start and end will be hidden and icon shown.
    -- The key is matched against the tag name, value type below.
    -- | icon            | optional icon inlined at start of tag           |
    -- | highlight       | optional highlight for the icon                 |
    -- | scope_highlight | optional highlight for item associated with tag |
    tag = {},
  },
}
