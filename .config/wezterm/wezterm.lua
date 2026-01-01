-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Font size and set typography and weight
config.font_size = 20
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })

-- Theme - Rose Pine
config.color_scheme = "rose-pine"

-- Window configuration
config.window_padding = {
	left = 10,
	right = 10,
	top = 15,
	bottom = 15,
}

-- Foreground / background selected text
config.colors = {
	-- the foreground color of selected text
	selection_fg = "#FFBE69",
	-- the background color of selected text
	selection_bg = "#26233C",
}

-- For macOS only
if wezterm.target_triple == "aarch64-apple-darwin" or "x86_64-apple-darwin" then
	-- macOS hash key fix
	config.send_composed_key_when_left_alt_is_pressed = true
	-- Turn off macOS fullscreen mode
	config.native_macos_fullscreen_mode = false
end

-- Tab bar
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 999

local function get_max_cols(window)
	local tab = window:active_tab()
	local cols = tab:get_size().cols
	return cols
end

wezterm.on("window-config-reloaded", function(window)
	wezterm.GLOBAL.cols = get_max_cols(window)
end)

wezterm.on("window-resized", function(window)
	wezterm.GLOBAL.cols = get_max_cols(window)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	local full_title = "[" .. tab.tab_index + 1 .. "] " .. title
	local pad_length = (wezterm.GLOBAL.cols // #tabs - #full_title) // 2
	if pad_length * 2 + #full_title > max_width then
		pad_length = (max_width - #full_title) // 2
	end
	return string.rep(" ", pad_length) .. full_title .. string.rep(" ", pad_length)
end)

-- Tab bar configuration
config.hide_tab_bar_if_only_one_tab = true

-- Disable the title bar but enable the resizeable border
config.window_decorations = "RESIZE"

-- Finally, return the configuration to wezterm:
return config
