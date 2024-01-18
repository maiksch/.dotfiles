-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration
local config = {}

-- in newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- this is where you actually apply your config choices

-- colorscheme
config.color_scheme = "Monokai Pro (Gogh)"
config.colors = {
	background = "#282828",
	cursor_fg = "#19181A",
	cursor_bg = "#FBF1C7",
}
-- font
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
-- disable tab bar
config.enable_tab_bar = false
-- disable font ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
