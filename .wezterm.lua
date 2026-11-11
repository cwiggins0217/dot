local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

-------------------------------- Font and opacity --------------------------
config.font = wezterm.font_with_fallback{ -- also disables ligatures
  { family = "Intel One Mono", weight = 'Regular', harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, }, -- disable ligatures
  { family = "JetBrains Mono", scale = 1.00, harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, }, }

config.font_size = 12.0 -- this highly depends on screen res and size, just adjust as needed
config.line_height = 1.18
config.cell_width = 1.04

config.freetype_load_target = 'Normal'
config.freetype_render_target = 'Normal'

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
config.animation_fps = 165 -- FIXME adjust as neeed
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
    foreground = '#c6c8c0',
    background = '#292c2e',
    cursor_bg = '#a4b9cb',
    cursor_fg = '#292c2e',
    cursor_border = '#a4b9cb',
    selection_bg = '#45535b',
    selection_fg = '#d5d8d0',
    ansi = {
        '#292c2e', '#c9aca5', '#b6c4a0', '#c4b6a3',
        '#a4b9cb', '#baafc5','#96b9b5', '#c6c8c0',
    },
    brights = {
        '#89928e', '#d5b8b0', '#c2cfad', '#d1c1ad',
        '#b3c7d7', '#c8bbd2','#a6c9c3', '#e0e1d9',
    },
--  background = '#343738',
--  foreground = '#B9BCB5',
--
--  cursor_bg = '#9FAFBA',
--  cursor_fg = '#343738',
--  cursor_border = '#9FAFBA',
--
--  selection_bg = '#505D61',
--  selection_fg = '#D1D5CE',
--
--  ansi = {
--    '#343738', '#C1A6A0',
--    '#AEBC9F', '#C0B3A4',
--    '#9FAFBA', '#B5AABC',
--    '#97B4B1', '#B9BCB5',
--  },
--
--  brights = {
--    '#969F9C', '#CFB0A8',
--    '#BEC9B1', '#CBBEAE',
--    '#B1C1CB', '#C4B9CB',
--    '#AAC5C0', '#D7DAD2',
--  },
}

return config
