-- Settings
hs.window.animationDuration = 0

-- Specify your combination (your hyperkey)
local hyper = {"cmd", "alt", "ctrl", "shift"}

-- We use 0 to reload the configuration
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

-- Notify about the config reload
hs.notify.new({
  title = "Hammerspoon",
  informativeText = "Config loaded"
}):send()

-- this one for fullscreen mode
hs.hotkey.bind(hyper, "f", function()
  local win = hs.window.frontmostWindow()
  win:setFullscreen(not win:isFullscreen())
end)

-- apps
local applicationHotkeys = {
  c = 'Google Chrome',
  k = 'kitty',
  s = 'Slack',
  y = 'Skype',
  v = 'Visual Studio Code',
  m = 'Spotify'
}
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    toggleApp(app)
  end)
end

function toggleApp(_app)
  local frontApp = hs.application.frontmostApplication()
  if frontApp:title() == _app then
    frontApp:hide()
  else
    hs.application.launchOrFocus(_app)
  end
end

-- Ping
function pingResult(object, message, seqnum, error)
  if message == "didFinish" then
    avg = tonumber(string.match(object:summary(), '/(%d+.%d+)/'))
    if avg == 0.0 then
      hs.alert.show("No network")
    elseif avg < 200.0 then
      hs.alert.show("Network good (" .. avg .. "ms)")
    elseif avg < 500.0 then
      hs.alert.show("Network poor(" .. avg .. "ms)")
    else
      hs.alert.show("Network bad(" .. avg .. "ms)")
    end
  end
end
hs.hotkey.bind(hyper, "p", function()
  hs.network.ping.ping("8.8.8.8", 1, 0.01, 1.0, "any", pingResult)
end)

-- WINDOW MANAGEMENT
local wm = require('window-management')
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper, key, fn)
  end
end

-- * Move window to screen
windowBind({"ctrl", "alt"}, {
  left = wm.throwLeft,
  right = wm.throwRight
})

-- * Set Window Position on screen
windowBind({"ctrl", "alt", "cmd", "shift"}, {
  Return = wm.maximizeWindow,    -- ⌃⌥⌘ + M
--   c = wm.centerOnScreen,    -- ⌃⌥⌘ + C
  left = wm.leftHalf,       -- ⌃⌥⌘ + ←
  right = wm.rightHalf,     -- ⌃⌥⌘ + →
  up = wm.topHalf,          -- ⌃⌥⌘ + ↑
  down = wm.bottomHalf      -- ⌃⌥⌘ + ↓
})
-- * Set Window Position on screen
windowBind({"ctrl", "alt", "shift"}, {
  left = wm.rightToLeft,      -- ⌃⌥⇧ + ←
  right = wm.rightToRight,    -- ⌃⌥⇧ + →
  up = wm.bottomUp,           -- ⌃⌥⇧ + ↑
  down = wm.bottomDown        -- ⌃⌥⇧ + ↓
})
-- * Set Window Position on screen
windowBind({"alt", "cmd", "shift"}, {
  left = wm.leftToLeft,      -- ⌥⌘⇧ + ←
  right = wm.leftToRight,    -- ⌥⌘⇧ + →
  up = wm.topUp,             -- ⌥⌘⇧ + ↑
  down = wm.topDown          -- ⌥⌘⇧ + ↓
})

-- * Windows-like cycle
windowBind({"ctrl", "alt", "cmd"}, {
  u = wm.cycleLeft,          -- ⌃⌥⌘ + u
  i = wm.cycleRight          -- ⌃⌥⌘ + i
})