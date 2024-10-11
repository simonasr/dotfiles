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
  o = 'Opera GX',
  k = 'kitty',
  s = 'Slack',
  y = 'Signal',
  d = 'Discord',
  v = 'Visual Studio Code',
  m = 'Spotify',
  t = 'Telegram'
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

-- -- WINDOW MANAGEMENT

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.0
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "return"},
  nextscreen = {hyper, "n"}
})