-- https://github.com/wez/wezterm/discussions/4796#discussioncomment-8394398
local wezterm = require 'wezterm'
local platform = require 'platform'

local M = {}

-- Converts Windows backslashes to forwards slashes
---@param path string
local function normalize_path(path)
  return platform.is_win and path:gsub('\\', '/') or path
end

--- If name nil or false print err_message
---@param name string|boolean|nil
---@param err_message string
local function err_if_not(name, err_message)
  if not name then
    wezterm.log_error(err_message)
  end
end

--- path if file or directory exists nil otherwise
---@param path string
local function file_exists(path)
  if path == nil then
    return nil
  end
  local f = io.open(path, 'r')
  -- io.open won't work to check if directories exist,
  -- but works for symlinks and regular files
  if f ~= nil then
    wezterm.log_info(path .. ' file or symlink found')
    io.close(f)
    return path
  end
  return nil
end

--- Merge numeric tables
---@param t1 table
---@param t2 table
---@return table
local function merge_tables(t1, t2)
  local result = {}
  for index, value in ipairs(t1) do
    result[index] = value
  end
  for index, value in ipairs(t2) do
    result[#t1 + index] = value
  end
  return result
end

local home = normalize_path(wezterm.home_dir)
local fd = (
  file_exists(home .. '/bin/fd')
  or file_exists(home .. '/bin/fd.exe')
  or file_exists '/usr/bin/fd'
  or file_exists(home .. '/AppData/Local/Microsoft/WinGet/Links/fd.exe')
  or file_exists(home .. '/AppData/Local/Microsoft/WinGet/Packages/sharkdp.fd_Microsoft.Winget.Source_8wekyb3d8bbwe/fd-v9.0.0-x86_64-pc-windows-msvc/fd.exe')
)
err_if_not(fd, 'fd not found')

local srcPath = home .. '/source/repos/'
err_if_not(srcPath, srcPath .. 'not found')

local search_folders = {
  srcPath,
  home,
}

M.start = function(window, pane)
  local projects = {}
  -- local cmd = merge_tables({ fd, '-HI', '-td', '^.git$', '--max-depth=3', '.' }, search_folders)
  local cmd = merge_tables({ fd, '-HI', '-td', '^.git$', '--max-depth=3' }, search_folders)
  wezterm.log_info 'cmd: '
  wezterm.log_info(cmd)

  for _, value in ipairs(cmd) do
    wezterm.log_info(value)
  end
  local success, stdout, stderr = wezterm.run_child_process(cmd)

  if not success then
    wezterm.log_error('Failed to run fd: ' .. stderr)
    return
  end

  for line in stdout:gmatch '([^\n]*)\n?' do
    local project = normalize_path(line):gsub('/.git/$', '')
    local label = project
    local id = project:gsub('.*/', '')
    table.insert(projects, { label = tostring(label), id = tostring(id) })
  end

  window:perform_action(
    wezterm.action.InputSelector {
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info 'Cancelled'
        else
          wezterm.log_info('Selected ' .. label)
          win:perform_action(wezterm.action.SwitchToWorkspace { name = id, spawn = { cwd = label } }, pane)
        end
      end),
      fuzzy = true,
      title = 'Select project',
      choices = projects,
    },
    pane
  )
end

return M
