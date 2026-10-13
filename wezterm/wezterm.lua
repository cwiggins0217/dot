local wezterm = require("wezterm")
local mux = wezterm.mux
--------------------------- Begin Config ---------------------------------------
local config = {}
if wezterm.config_builder then config = wezterm.config_builder() end

-------------------------------- Font and Colorscheme --------------------------
config.font = wezterm.font_with_fallback{ -- also disables ligatures
  { family = "OCR B", scale = 1.00, harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, },
  { family = "JetBrains Mono", scale = 1.00, harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, }, }

-- Neil Panchal's 'usgc-reticle' theme, from US Graphics
 config.color_schemes = {
   ["USGC RETICLE"] = {
     foreground = "#00A35E",
     background = "#000000",

     cursor_bg = "#759D95",
     cursor_fg = "#FFFFFF",

     selection_bg = "#003D80",
     selection_fg = "#FEC400",

     ansi = {
       "#222B26", -- black
       "#E00000", -- red
       "#FEC400", -- green
       "#FEC400", -- yellow
       "#1986F6", -- blue
       "#F94D8D", -- magenta
       "#00A9FC", -- cyan
       "#E9FFFC", -- white
     },

     brights = {
       "#424F46", -- bright black
       "#E00000", -- bright red
       "#F3BC00", -- bright green
       "#FEC400", -- bright yellow
       "#FE761F", -- bright blue
       "#F94D8D", -- bright magenta
       "#00A8FC", -- bright cyan
       "#E8FFFC", -- bright white
     },

     -- From the original iTerm theme
     compose_cursor = "#FFFFFF",
   },
}

config.color_scheme = "USGC RETICLE"

config.window_background_opacity = 1.00
if myos == "windows" then -- windows-specific desktop env stuff
	config.win32_system_backdrop = "Auto" -- only this seems to work
end
------------------------ Window Padding and Color Hacks ------------------------
config.window_padding = {
	left = 10,
	right = 10,
	top = 20,
	bottom = 10,
}
-------------------------------- Misc ------------------------------------------
config.bold_brightens_ansi_colors = false -- bold is bright, zenburn needs this on
config.window_decorations = "TITLE|RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
-- config.default_workspace = "Home" -- TODO look into workspaces sometime
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 144 -- FIXME adjust as neeed
config.audible_bell = "Disabled" -- for the love of God, turn this shit off
config.front_end = "WebGpu" -- this should be global
--------------------------------------------------------------------------------
return config
