local wezterm = require("wezterm")
local mux = wezterm.mux


-------------------------------- Detect OS -------------------------------------
local function detect_os()
    if wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
        return "macos"
    elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
        return "windows"
    elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
        return "linux"
    else
        return "unknown"
    end
end
local myos = detect_os()
--------------------------------------------------------------------------------


---------------------------- Detect Shell --------------------------------------
local function detect_shell()
    if myos == "windows" then
        return { "wsl.exe" }
    elseif myos == "mac" then
        return { "/opt/homebrew/bin/bash", "--login", }
    else
        return { "/bin/bash", "--login" }
    end
end
local myshell = detect_shell()
--------------------------------------------------------------------------------


--------------------------- Begin Config ---------------------------------------
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end
if myos == "windows" then -- powershell default for windows
    config.default_prog = { 'powershell' }
elseif myos == "linux" or myos == "macos" then -- FIXME linux and mac should do the same, right?
    config.default_prog = { '/usr/bin/zsh' }
end
--------------------------------------------------------------------------------


-------------------------------- Font and Colorscheme --------------------------
config.font = wezterm.font_with_fallback{ -- also disables ligatures
  { family = "CommitMono", scale = 1.00, harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, },
  { family = "JetBrains Mono", scale = 1.00, harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, }, }

--config.color_scheme = "Selenized Dark (Gogh)"
--config.color_scheme = "Selenized Light (Gogh)"
config.color_scheme = "Zenburn"

if myos == "windows" then -- windows-specific desktop env stuff
    config.win32_system_backdrop = 'Auto' -- the other options are buggy, only this seems to work
    config.front_end = "WebGpu"
    config.window_background_opacity = 1.0 -- can be toggled with function below
end
--------------------------------------------------------------------------------


---------------------------- Toggle opacity ------------------------------------
if myos == "windows" then
wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}

  -- If we are currently opaque, make it transparent
  if not overrides.window_background_opacity or overrides.window_background_opacity == 1.0 then
    overrides.window_background_opacity = 0.95
    -- Using the RGB for Selenized Dark (16, 60, 72)
    -- Using the RGB for Zenburn (63, 63, 63)
    -- The 0.8 alpha ensures it doesn't "white out"
    overrides.colors = {
      background = 'rgba(63, 63, 63, 0.90)',
    }
  else
    -- Toggle OFF: Reset to fully opaque
    overrides.window_background_opacity = 1.0
    overrides.colors = nil
  end

  window:set_config_overrides(overrides)
end)
end
--------------------------------------------------------------------------------


---------------------------------- Keybinds ------------------------------------
config.keys = {
	{ key = '%', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },},
	{ key = '"', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical   { domain = 'CurrentPaneDomain' },},
	{ key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left',},
  	{ key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right',},
  	{ key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up',},
  	{ key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down',},
	{ key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action.ToggleFullScreen,},
    { key = 'i', mods = 'CTRL|SHIFT', action = wezterm.action.Search 'CurrentSelectionOrEmptyString',},

  {
    key = 'o',         -- toggle opacity
    mods = 'CTRL|SHIFT',
    action = wezterm.action.EmitEvent 'toggle-opacity',
  },
 }
 -------------------------------------------------------------------------------


------------------------ Window Padding and Color Hacks ------------------------
config.window_padding = {
	left = 10,
	right = 10,
	top = 20,
	bottom = 10,
}
--------------------------------------------------------------------------------


-------------------------------- Misc ------------------------------------------
config.prefer_egl = true -- TODO look this up, can't remember what it does
config.bold_brightens_ansi_colors = true -- bold is bright, really zenburn requires this
config.window_decorations = "TITLE|RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "Home" -- TODO look into workspaces sometime
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 144 -- FIXME adjust as neeed
config.audible_bell = "Disabled" -- for the love of God, turn this shit off
--------------------------------------------------------------------------------

return config
