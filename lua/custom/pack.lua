local M = {}

local function is_url(src)
  return src:match '^[%w+.-]+://' ~= nil or src:match '^git@' ~= nil
end

function M.src(repo)
  if is_url(repo) then return repo end
  return 'https://github.com/' .. repo
end

function M.version(version)
  if type(version) ~= 'string' then return version end
  if version == '*' or version:find('*', 1, true)
    or version:find('^', 1, true)
    or version:find('~', 1, true)
    or version:find('<', 1, true)
    or version:find('>', 1, true)
  then
    return vim.version.range(version)
  end
  return version
end

function M.add(repo, opts)
  opts = opts or {}
  local spec = {
    src = M.src(repo),
    name = opts.name,
    version = M.version(opts.version or opts.branch),
  }
  local add_opts = { confirm = opts.confirm or false }
  if opts.load ~= nil then add_opts.load = opts.load end

  vim.pack.add({ spec }, add_opts)
end

function M.add_many(repos, opts)
  opts = opts or {}
  local specs = {}
  for _, repo in ipairs(repos) do
    if type(repo) == 'string' then
      specs[#specs + 1] = { src = M.src(repo) }
    else
      specs[#specs + 1] = {
        src = M.src(repo.src or repo[1]),
        name = repo.name,
        version = M.version(repo.version or repo.branch),
      }
    end
  end
  local add_opts = { confirm = opts.confirm or false }
  if opts.load ~= nil then add_opts.load = opts.load end

  vim.pack.add(specs, add_opts)
end

return M
