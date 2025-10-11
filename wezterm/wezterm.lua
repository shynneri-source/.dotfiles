local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-attached', function(domain)
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == mux.get_active_workspace() then
      window:gui_window():toggle_fullscreen() 
    end
  end
end)

return {
  font = wezterm.font("Iosevka Nerd Font Mono"),
  font_size = 12.0,

  color_scheme = "Gruvbox Dark",

  window_background_opacity = 0.9,

  window_decorations = "NONE",

  enable_scroll_bar = false,

  hide_tab_bar_if_only_one_tab = true,

  use_fancy_tab_bar = false,

  keys = {
    {
      key = "T",
      mods = "CTRL|ALT",
      action = wezterm.action.SpawnTab("DefaultDomain"),
    },
    {
      key = "W",
      mods = "CTRL|SHIFT",
      action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
      key = "P",
      mods = "CTRL|SHIFT",
      action = wezterm.action.PromptInputLine {
        description = "Run command",
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:perform_action(wezterm.action.SpawnCommandInNewTab{
              args = wezterm.shell_split(line)
            }, pane)
          end
        end),
      },
    },
    {
      key = "F11",
      mods = "CTRL",
      action = wezterm.action.ToggleFullScreen,
    },
  },

  mouse_bindings = {
    {
      event = { Down = { streak = 1, button = "Right" } },
      mods = "NONE",
      action = wezterm.action.PasteFrom("Clipboard"),
    },
  },

  adjust_window_size_when_changing_font_size = false,
}

