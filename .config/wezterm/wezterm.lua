-- hellor from thr otehr 0
local wezterm = require("wezterm")
local act = wezterm.action
return {
  font_shaper = "Harfbuzz",
  font = wezterm.font("MonaspiceNe NFP", { weight = "Regular", italic = false }),
  term = "xterm-256color",
  color_scheme = "Catppuccin Macchiato (Gogh)",
  colors = {
    visual_bell = "#202020",
  },
  window_close_confirmation = "NeverPrompt",
  force_reverse_video_cursor = true,
  default_cursor_style = "SteadyBar",
  cursor_thickness = 3,
  detect_password_input = true,
  window_background_opacity = 0.95,
  text_background_opacity = 1.5,
  enable_tab_bar = false,
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
  keys = {
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
}
