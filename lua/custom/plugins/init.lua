-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local function load_plugin(module)
  require('custom.plugins.' .. module)
end

-- Iterate over all Lua files in the plugins directory and load them.
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
local modules = {}
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    modules[#modules + 1] = file_name:gsub('%.lua$', '')
  end
end

table.sort(modules)

local loaded = {}
for _, module in ipairs { 'snacks', 'tiny-inline-diagnostic' } do
  if vim.tbl_contains(modules, module) then
    load_plugin(module)
    loaded[module] = true
  end
end

for _, module in ipairs(modules) do
  if not loaded[module] then load_plugin(module) end
end
