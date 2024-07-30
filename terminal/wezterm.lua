local wezterm = require("wezterm")
local config = {}

if wezterm.target_triple:find("darwin") then
	config.integrated_title_buttons = {}
	config.window_background_opacity = 0.9
	config.macos_window_background_blur = 15
	config.integrated_title_button_style = "MacOsNative"
elseif wezterm.target_triple:find("windows") then
	config.window_background_opacity = 0.9
	config.win32_system_backdrop = "Mica"
elseif wezterm.target_triple:find("linux") then
	config.integrated_title_button_style = "Gnome"
	config.integrated_title_buttons = { "Hide", "Close" }
end

config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 14.5
-- config.color_scheme = "Gruvbox Material (Gogh)" -- "Gruvbox dark, hard (base16)"
config.color_scheme = "Gruvbox dark, hard (base16)"

config.window_frame = {
	font_size = 14,
}
config.window_padding = {
	top = 10,
	bottom = 10,
	-- left = 0,
	-- right = 0,
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.window_close_confirmation = "NeverPrompt"

config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.show_new_tab_button_in_tab_bar = true
config.prefer_to_spawn_tabs = true

config.freetype_load_target = "Normal"

-- Startup --
config.default_cwd = wezterm.home_dir
-- config.default_prog = {'zsh', '-l'}

-- Behaviour --
config.check_for_updates = false
-- config.audible_bell = "Disabled"

-- Performance ---
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 144
-- config.animation_fps = 10
-- config.scrollback_lines = 5000

-- Key bindings --
-- config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  -- stylua: ignore
	-- splitting
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "=", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "z", action = wezterm.action.TogglePaneZoomState },
	-- rotate panes
	{ mods = "LEADER", key = "Space", action = wezterm.action.RotatePanes("Clockwise") },
	-- show the pane selection mode, but have it swap the active and selected panes
	{ mods = "LEADER", key = "0", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },
	{ mods = "LEADER", key = "Enter", action = wezterm.action.ActivateCopyMode },
	-- Change Active Pane
	{ key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	-- Resize Active Pane
	{ key = "h", mods = "META", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "META", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "META", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "META", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	-- CloseCurrentPane
	{ key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
}

return config
