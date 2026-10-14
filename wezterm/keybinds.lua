local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    -- タブ移動
    { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },

    -- ペイン分割
    { key = 'd', mods = 'CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'd', mods = 'CMD|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },

    -- ペインを閉じる
    { key = 'w', mods = 'CMD|SHIFT', action = act.CloseCurrentPane { confirm = true } },

    -- ペイン移動
    { key = 'h', mods = 'CMD|SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'CMD|SHIFT', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'CMD|SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'CMD|SHIFT', action = act.ActivatePaneDirection 'Right' },

    -- Leader + h/j/k/l でペイン移動
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },

    -- Leader + Shift + h/j/k/l でペインサイズ変更
    { key = 'h', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Left', 3 } },
    { key = 'j', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Down', 3 } },
    { key = 'k', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Up', 3 } },
    { key = 'l', mods = 'LEADER|SHIFT', action = act.AdjustPaneSize { 'Right', 3 } },

    -- Leader + z で最大化、Leader + x でペインを閉じる
    { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
    { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },

    -- Leader + [ でコピーモード
    { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
  },
}
