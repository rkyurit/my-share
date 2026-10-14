local wezterm = require 'wezterm'
local keybinds = require 'keybinds'

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Hiragino Sans",
})
config.automatically_reload_config = true
config.font_size = 14.0
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.keys = keybinds.keys
config.leader = { key = 'z', mods = 'ALT', timeout_milliseconds = 2000 }

config.window_frame = {
  inactive_titlebar_bg = 'none',
  active_titlebar_bg = 'none',
}

config.window_background_gradient = {
 colors = { "#000000" }
}
config.show_new_tab_button_in_tab_bar = false
-- nightly専用の設定らしい
-- config.show_close_tab_button_in_tabs = false

config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
} 


wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#37474F"
  local foreground = "#FFFFFF"

  if tab.is_active then
    background = "#2563EB"
    forground = "#FFFFFF"
  end

  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = background }  },
    { Foreground = { Color = foreground }  },
    { Text = title  },
  }
end)

wezterm.on('update-right-status', function(window)
  if window:leader_is_active() then
    window:set_right_status(' LEADER ')
  else
    window:set_right_status('')
  end
end)

return config
