local wezterm = require("wezterm")
local session_manager = require("wezterm-session-manager/session-manager")

local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("JetBrains Mono")

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.tab_bar_at_bottom = true

-- Always confirm before closing
config.skip_close_confirmation_for_processes_named = {}

config.unix_domains = {
  {
    name = "unix",
    local_echo_threshold_ms = 10,
  },
}
config.default_gui_startup_args = { "connect", "unix" }

-- navigation.nvim
-- https://github.com/numToStr/Navigator.nvim/wiki/WezTerm-Integration
local function isViProcess(pane)
  -- get_foreground_process_name On Linux, macOS and Windows,
  -- the process can be queried to determine this path. Other operating systems
  -- (notably, FreeBSD and other unix systems) are not currently supported
  return pane:get_foreground_process_name():find("n?vim") ~= nil or pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
  if isViProcess(pane) then
    window:perform_action(
      -- This should match the keybinds you set in Neovim.
      act.SendKey({ key = vim_direction, mods = "CTRL" }),
      pane
    )
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
  conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
  conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
  conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
  conditionalActivatePane(window, pane, "Down", "j")
end)

-- wezterm-session-manager
wezterm.on("save_session", function(window)
  session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
  session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
  session_manager.restore_state(window)
end)

config.keys = {
  -- Split with LEADER-v LEADER-h
  {
    key = "v",
    mods = "LEADER",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },

  -- Close with LEADER-x
  {
    key = "x",
    mods = "LEADER",
    action = act.CloseCurrentPane({ confirm = true }),
  },

  -- Navigate with CTRL-hjkl
  {
    key = "h",
    mods = "CTRL",
    -- action = act.ActivatePaneDirection("Left"),
    action = act.EmitEvent("ActivatePaneDirection-left"),
  },
  {
    key = "j",
    mods = "CTRL",
    -- action = act.ActivatePaneDirection("Down"),
    action = act.EmitEvent("ActivatePaneDirection-down"),
  },
  {
    key = "k",
    mods = "CTRL",
    -- action = act.ActivatePaneDirection("Up"),
    action = act.EmitEvent("ActivatePaneDirection-up"),
  },
  {
    key = "l",
    mods = "CTRL",
    -- action = act.ActivatePaneDirection("Right"),
    action = act.EmitEvent("ActivatePaneDirection-right"),
  },

  -- Move Tab by CTRL-SHIFT-Left/Right
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = act.MoveTabRelative(-1),
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = act.MoveTabRelative(1),
  },

  -- Rename tab
  -- https://github.com/wez/wezterm/issues/522#issuecomment-1496894508
  {
    key = ",",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },

  -- Clear screen with LEADER-CTRL-k
  {
    key = "k",
    mods = "CTRL|LEADER",
    action = act.ClearScrollback("ScrollbackAndViewport"),
  },

  -- Zoom
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },

  -- TODO: add LEADER-CTRL-R to repawn the pane

  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = "a",
    mods = "LEADER|CTRL",
    action = act.SendKey({ key = "a", mods = "CTRL" }),
  },

  -- wezterm-session-manager
  { key = "s", mods = "CTRL|LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
  { key = "l", mods = "CTRL|LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
  { key = "r", mods = "CTRL|LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },
}

-- LEADER-123 to jump to tab
for i = 1, 9 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

return config
