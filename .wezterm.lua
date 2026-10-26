local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

-------------------------------- Font and opacity --------------------------
config.font = wezterm.font_with_fallback{ -- also disables ligatures
  { family = "Intel One Mono", scale = 1.00, harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, }, -- disable ligatures
  { family = "JetBrains Mono", scale = 1.00, harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, }, }

config.window_background_opacity = 1.00

if myos == "windows" then -- windows-specific desktop env stuff
	config.win32_system_backdrop = "Auto" -- only this seems to work
end
-------------------------------- Misc ------------------------------------------
config.bold_brightens_ansi_colors = false -- bold is not bright
config.window_decorations = "TITLE|RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 144 -- FIXME adjust as neeed
config.audible_bell = "Disabled" -- for the love of God, turn this shit off
config.front_end = "WebGpu" -- this should be global
------------------------ Window Padding and Color Hacks ------------------------
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 20,
}

----------------------- Color scheme -------------------------------------------
config.colors = {
    foreground = '#D8DAD7',
    background = '#303235',
    cursor_bg = '#D8DAD7',
    cursor_fg = '#303235',
    cursor_border = '#D8DAD7',
    selection_bg = '#41464A',
    selection_fg = '#D8DAD7',
    ansi = {
        '#303235', '#D5A0A0', '#A6BFA6', '#D1BE91',
        '#A8BFCE', '#BCAACB','#A3C4C5', '#D8DAD7',
    },
    brights = {
        '#62686C', '#E2B0B0', '#B8CEB8', '#DFCEA6',
        '#BCD0DD', '#CDBDDA','#B5D3D3', '#ECEDE9',
    },
}

return config
