local wezterm = require 'wezterm'
local platform = require 'platform'
local sessionizer = require 'sessionizer'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- General config
config.color_scheme = 'Tokyo Night (Gogh)'
config.check_for_updates = true
config.inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
}

config.font = wezterm.font_with_fallback {
    'JetBrains Mono',
    'Fira Code',
}
config.warn_about_missing_glyphs = false
config.font_size = 14.0
config.launch_menu = {}
config.leader = { key = 'a', mods = 'CTRL' }
config.disable_default_key_bindings = true
config.set_environment_variables = {}
config.window_background_opacity = 1.0

-- Keymap
config.keys = {
    { key = 'a',          mods = 'LEADER|CTRL',  action = wezterm.action { SendString = '\x01' } },
    { key = '-',          mods = 'LEADER',       action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },
    { key = '\\',         mods = 'LEADER',       action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
    { key = 'z',          mods = 'LEADER',       action = 'TogglePaneZoomState' },
    { key = 'c',          mods = 'LEADER',       action = wezterm.action { SpawnTab = 'CurrentPaneDomain' } },
    { key = 'h',          mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'j',          mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Down' } },
    { key = 'k',          mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'l',          mods = 'LEADER',       action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 'H',          mods = 'LEADER|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Left', 5 } } },
    { key = 'J',          mods = 'LEADER|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Down', 5 } } },
    { key = 'K',          mods = 'LEADER|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Up', 5 } } },
    { key = 'L',          mods = 'LEADER|SHIFT', action = wezterm.action { AdjustPaneSize = { 'Right', 5 } } },
    { key = '1',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 0 } },
    { key = '2',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 1 } },
    { key = '3',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 2 } },
    { key = '4',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 3 } },
    { key = '5',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 4 } },
    { key = '6',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 5 } },
    { key = '7',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 6 } },
    { key = '8',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 7 } },
    { key = '9',          mods = 'LEADER',       action = wezterm.action { ActivateTab = 8 } },
    { key = '&',          mods = 'LEADER|SHIFT', action = wezterm.action { CloseCurrentTab = { confirm = true } } },
    { key = 'x',          mods = 'LEADER',       action = wezterm.action { CloseCurrentPane = { confirm = true } } },

    { key = 'n',          mods = 'SHIFT|CTRL',   action = 'ToggleFullScreen' },
    { key = 'v',          mods = 'SHIFT|CTRL',   action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'c',          mods = 'SHIFT|CTRL',   action = wezterm.action.CopyTo 'Clipboard' },

    { key = 's',          mods = 'LEADER',       action = wezterm.action_callback(sessionizer.start) },
    { key = 'l',          mods = 'ALT',          action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES|FUZZY' } },
    { key = 'Tab',        mods = 'LEADER',       action = wezterm.action.ShowLauncher },

    { key = '+',          mods = 'SHIFT|CTRL',   action = wezterm.action.IncreaseFontSize },
    { key = '-',          mods = 'SHIFT|CTRL',   action = wezterm.action.DecreaseFontSize },
    { key = '0',          mods = 'SHIFT|CTRL',   action = wezterm.action.ResetFontSize },

    { key = 'f',          mods = 'SHIFT|CTRL',   action = wezterm.action { Search = 'CurrentSelectionOrEmptyString' } },
    { key = 'phys:Space', mods = 'SHIFT|CTRL',   action = wezterm.action.QuickSelect },
    { key = 'x',          mods = 'SHIFT|CTRL',   action = wezterm.action.ActivateCopyMode },
}

if platform.is_win then
    config.default_prog = { 'pwsh.exe' }
    table.insert(config.launch_menu, { label = 'PowerShell', args = { 'powershell.exe', '-NoLogo' } })
    table.insert(config.launch_menu, { label = 'PowerShell 7', args = { 'pwsh.exe', '-NoLogo' } })

    -- Environment command prompts to the menu
    for _, vsvers in ipairs(wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')) do
        local year = vsvers:gsub('Microsoft Visual Studio/', '')
        table.insert(config.launch_menu, {
            label = 'x64 Native Tools VS ' .. year,
            args = { 'cmd.exe', '/k', 'C:/Program Files (x86)/' .. vsvers .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat' },
        })
    end
end

return config
