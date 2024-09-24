local wezterm = require("wezterm")
local config = {}
local mod_key

if wezterm.target_triple:find("darwin") then
	mod_key = "CMD"
	config.window_frame = {
		font_size = 14,
	}
	config.integrated_title_buttons = {}
	config.macos_window_background_blur = 15
	config.integrated_title_button_style = "MacOsNative"
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.font_size = 14.5
elseif wezterm.target_triple:find("linux") then
	mod_key = "CTRL"
	config.window_frame = {
		font_size = 11,
	}
	config.integrated_title_button_style = "Gnome"
	config.window_decorations = "NONE"
	config.enable_wayland = true
	config.default_prog = { "zsh" }
	config.font_size = 12
end

config.font = wezterm.font("MesloLGS Nerd Font")
-- config.color_scheme = "Gruvbox Material (Gogh)" -- "Gruvbox dark, hard (base16)"
config.color_scheme = "Gruvbox dark, hard (base16)"

config.window_padding = {
	top = 10,
	bottom = 10,
	-- left = 0,
	-- right = 0,
}
config.window_background_opacity = 0.95
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

-- Behaviour --
config.check_for_updates = false
config.audible_bell = "Disabled"

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
  { mods = "LEADER", key = "-",       action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "=", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "z", action = wezterm.action.TogglePaneZoomState },

	-- rotate panes
	{ mods = "LEADER", key = "Space", action = wezterm.action.RotatePanes("Clockwise") },
	{ mods = "LEADER", key = "0", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },
	{ mods = "LEADER", key = "Enter", action = wezterm.action.ActivateCopyMode },

	-- Change Active Pane
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	-- Resize Active Pane
	{ key = "h", mods = "META", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "META", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "META", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "META", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },

	-- CloseCurrentPane
	{ key = "w", mods = mod_key, action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "t", mods = mod_key, action = wezterm.action.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },

	-- { key = "l", mods = "CTRL", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },
	-- { key = "l", mods = "LEADER", action = wezterm.action.ShowLauncher },
	{ key = "s", mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "t", mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
}

return config
