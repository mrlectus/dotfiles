-- hellor from thr other 0
local wezterm = require("wezterm")
local session_manager = require("wezterm-session-manager/session-manager")
local act = wezterm.action

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

return {
	font_shaper = "Harfbuzz",
	font = wezterm.font("MonaspiceNe NFP", { weight = "Regular", italic = false }),
	term = "wezterm",
	color_scheme = "Dracula+",
	colors = {
		visual_bell = "#202020",
		tab_bar = {
			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			background = "#0b0022",

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = "#2b2042",
				-- The color of the text for the tab
				fg_color = "#c0c0c0",

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Normal",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = "#1b1032",
				fg_color = "#808080",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over inactive tabs
			inactive_tab_hover = {
				bg_color = "#3b3052",
				fg_color = "#909090",
				italic = true,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab_hover`.
			},

			-- The new tab button that let you create new tabs
			new_tab = {
				bg_color = "#1b1032",
				fg_color = "#808080",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			new_tab_hover = {
				bg_color = "#3b3052",
				fg_color = "#909090",
				italic = true,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab_hover`.
			},
		},
	},
	window_close_confirmation = "NeverPrompt",
	force_reverse_video_cursor = true,
	default_cursor_style = "SteadyBar",
	cursor_thickness = 3,
	detect_password_input = true,
	window_background_opacity = 0.95,
	text_background_opacity = 1.5,
	enable_tab_bar = true,
	enable_wayland = true,
	exit_behavior_messaging = "None",
	hyperlink_rules = wezterm.default_hyperlink_rules(),
	font_size = 15,
	harfbuzz_features = {
		"calt",
		"liga",
		"dlig",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
		"zero",
	},
	font_rules = {
		{
			italic = false,
			intensity = "Normal",
			font = wezterm.font("MonaspiceNe NFP", { weight = "Regular" }),
		},
		{
			italic = true,
			font = wezterm.font("MonaspiceRn NFP", { weight = "Black" }),
		},
	},
	visual_bell = {
		fade_in_duration_ms = 75,
		fade_out_duration_ms = 75,
		target = "CursorColor",
	},
	leader = { key = ",", mods = "CTRL", timeout_milliseconds = 1000 },
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = true,
	-- window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	keys = {
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = false }),
		},
		{ key = "t", mods = "ALT", action = act.SpawnTab("DefaultDomain") },
		{ key = "S", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
		{ key = "L", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
		{ key = "R", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },
		{
			key = "-",
			mods = "ALT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "n",
			mods = "ALT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "\\",
			mods = "ALT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "K",
			mods = "CTRL|SHIFT",
			action = act.Multiple({
				act.ClearScrollback("ScrollbackAndViewport"),
				act.SendKey({ key = "L", mods = "CTRL" }),
			}),
		},
		{
			key = "c",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				local has_selection = window:get_selection_text_for_pane(pane) ~= ""
				if has_selection then
					window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
					window:perform_action(act.ClearSelection, pane)
				else
					window:perform_action(act.SendKey({ key = "c", mods = "CTRL" }), pane)
				end
			end),
		},
	},
	mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = act.ScrollByLine(-3),
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = act.ScrollByLine(3),
		},
	},
}
